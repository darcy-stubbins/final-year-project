import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Select a New Profile Picture'),
                ),
              ),
            ),
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
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Save Changes'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
