import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //function to post the form off to the api to create a user
  void postRegister() async {
    //checking the confirmed password
    if (password != confirmedPassword) {
      return;
    }

    Map<String, String> data = {
      'user_name': name,
      'user_email': email,
      'user_password': password
    };

    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}user/create-user', data);

    Map<String, dynamic> createdResponse = jsonDecode(response);
    if (createdResponse['success']) {
      Core.getInstance().changeLoginRoutePageIndex(0);
    } else {
      print(createdResponse);
    }
  }

  //the passed in email and password
  String name = '';
  String email = '';
  String password = '';
  String confirmedPassword = '';

  void nameChanged(String name) {
    setState(() {
      this.name = name;
    });
  }

  void emailChanged(String email) {
    setState(() {
      this.email = email.toLowerCase();
    });
  }

  void passwordChanged(String password) {
    setState(() {
      this.password = password;
    });
  }

  void confirmedPasswordChanged(String confirmedPassword) {
    setState(() {
      this.confirmedPassword = confirmedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Card(
                margin: const EdgeInsets.all(20.0),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Create an account below!',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      //name input
                      TextFormField(
                        onChanged: nameChanged,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      //email input
                      TextFormField(
                        onChanged: emailChanged,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      //password input
                      TextFormField(
                        onChanged: passwordChanged,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      //confirm password input
                      TextFormField(
                        onChanged: confirmedPasswordChanged,
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      //create account button
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FilledButton(
                              onPressed: () {
                                postRegister();
                                Core.getInstance().changeLoginRoutePageIndex(2);
                              },
                              child: const Text('Create account'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
