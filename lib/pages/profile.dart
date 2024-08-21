import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/coreFunctionality/models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //function to return the user that is logged in
  User getLoggedInUser() {
    //decoding the json
    Map<String, dynamic> userMap = jsonDecode(
        '{"id": 1, "user_name": "chrispy","user_email": "chrispy@mail.com","user_password": "password"}');
    //assign the given json to user and return it
    User user = User.fromJson(userMap);

    return user;
  }

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

  void addFriend() {
    //http json request - to post the request to add a friend taking the inserted
    // query as the friend_id for the API function addFriend in the User class.
    //
    // final response = await http
    //   .post(
    //      Uri.parse('https://127.0.0.1/user/add-friend'),
    //      body: jsonEncode(<String, String>{
    //        'friend_id': this.query,
    //      })
    //    );
  }

  //the passed in query(friend search bar)
  String query = '';

  void searchBarChanged(String query) {
    setState(() {
      this.query = query;
    });
  }

  List<Widget> getFriendsList() {
    List<dynamic> friendList = jsonDecode(
        '[{"id": 2,"user_name": "John Doe","user_email": "john@mail.com","user_password": "xYYo.qAVBjVKV2qtxuMMm6/sQyH1RxNTzrTaLmbb3Ntug18D."},{"id": 4,"user_name": "Chris Curtis","user_email": "Chris@mail.com","user_password": "mv8vVspeE4msI9EhgsgCIuTV2WcN94DILKq4Aad44oIN6vIuqkg96"},{"id": 8,"user_name": "Adam Smith","user_email": "Adam123@mail.com","user_password": "3zqt8DloLe5Z1UN5ODqYAbDBnMQE9/l9iGEUTAKtmYn2efae"},{"id": 9,"user_name": "Susan Smith","user_email": "Susan99@mail.com","user_password": "lmmnFphwizJV4fpSTDs6ejqmr8EOW840KIwroJmkqs42W6W3GVeG"}]');
    //checking if the pattern_id passed in matches the selected pattern to return that patterns comments
    friendList = friendList.toList();

    //http json request - returns the current users added friends list from the API function getFriendsList
    // from the User class.
    //
    // final response = await http
    // .get(Uri.parse('https://127.0.0.1/user/get-friends-list'));
    // return Widget.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    //create an empty list of widgets
    List<Widget> friendWidgets = <Widget>[];
    //iterate over the friends and add them to friendsWidgets
    friendList.forEach((friendMap) {
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
    List<Widget> friendList = getFriendsList();
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
                        decoration: InputDecoration(
                          hintText: this.getLoggedInUser().userName,
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
                          onPressed: () {},
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
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                                'Are you sure you want to delete your account?',
                                style: Theme.of(context).textTheme.titleSmall),
                            // content: Text(''),
                            actions: <Widget>[
                              FilledButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Delete Account'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.red),
                        ),
                        child: const Text('Delete Account'),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: friendList,
                      ),
                    )
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
