import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //initilaising the profilepicture to be the placeholder
  Widget chosenImage = Image.asset(
    'assets/images/placeholder.jpg',
    fit: BoxFit.fill,
  );

  //image picker functionality to select a profile image
  Future<Widget> getImage() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      return Image.network(
        selectedImage.path,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.fill,
      );
    }
  }

  //function to add a friend via their username
  void addFriend() async {
    Map<String, String> data = {'friend_request': friendSearch};

    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}user/add-friend', data);
  }

  //the passed in query(friend search bar)
  String friendSearch = '';

  void searchBarChanged(String friendSearch) {
    setState(() {
      this.friendSearch = friendSearch;
    });
  }

  //function to update the users user name
  void updateUserName() async {
    Map<String, String> data = {'update_name': updatedName};

    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}user/update-user-name',
        data);

    Map<String, String> newUserName = jsonDecode(response);
  }

  //the passed in query(friend search bar)
  String updatedName = '';

  void nameUpdated(String updatedName) {
    setState(() {
      this.updatedName = updatedName;
    });
  }

  Future<List<Widget>> buildFriendsList() async {
    //hitting the api (user is hardcoded as no login system)
    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}user/get-friends-list',
        {});

    List<dynamic> friends = jsonDecode(response);

    friends = friends.toList();

    //create an empty list of widgets
    List<Widget> friendWidgets = <Widget>[];
    //iterate over the friends and add them to friendsWidgets
    friends.forEach((friendMap) {
      User friend = User.fromJson(friendMap as Map<String, dynamic>);
      friendWidgets.add(Text(
        friend.userName,
        style: Theme.of(context).textTheme.titleSmall,
      ));
    });
    return friendWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            Text('Edit Profile', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //profile picture display
                  Center(
                    child: Container(
                      height: 300,
                      width: 350,
                      padding: const EdgeInsets.only(
                          left: 50.0, top: 10.0, right: 50.0, bottom: 10.0),
                      child: chosenImage,
                    ),
                  ),
                  //select profile pic button
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: FilledButton(
                        onPressed: () async {
                          chosenImage = await getImage();
                          setState(() {});
                        },
                        child: const Text('Select a New Profile Picture'),
                      ),
                    ),
                  ),
                  //update profile name field and button
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
                    child: Text('Enter a new username',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        onChanged: nameUpdated,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //save changes button
                      Padding(
                        padding:
                            EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                        child: FilledButton(
                          onPressed: () {
                            updateUserName();
                          },
                          child: const Text('Save Changes'),
                        ),
                      ),
                      //add friend button with modal functionality
                      FilledButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Search for and add frinds',
                                style: Theme.of(context).textTheme.titleLarge),
                            //making it scrollable
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                    onChanged: searchBarChanged,
                                    decoration: InputDecoration(
                                      hintText: "Search here",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FilledButton(
                                onPressed: (addFriend),
                                child: const Text('Add friend'),
                              ),
                              FilledButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Close'),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                  //delete account button and modal functionality
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                      child: FilledButton(
                        onPressed: () {
                          Core.getInstance().logout();
                        },
                        child: const Text('Logout'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 20),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Your Friends',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    Center(
                      child: FutureBuilder<List<Widget>>(
                        future: buildFriendsList(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Widget>> snapshot) {
                          if (!snapshot.hasData) {
                            // while data is loading:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            //returns 'nothing found' if no patterns are found
                            List<Widget> friendsList = snapshot.data ?? [];

                            // data loaded:
                            return Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: friendsList ?? [],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
