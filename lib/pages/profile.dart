import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //image picker functionality
  Future getImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            Text('Edit Profile', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Card(
        margin: const EdgeInsets.all(20.0),
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
                child: Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //select profile pic button
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: FilledButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Text('Select a New Profile Picture'),
                ),
              ),
            ),
            //update profile name field and button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Update Name',
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
            //save changes button
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Save Changes'),
                ),
              ),
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
                          onPressed: () => Navigator.pop(context, 'Cancel'),
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
    );
  }
}
