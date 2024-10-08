import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //fucntion to post the user to the api to complete checks to log user in
  void postLogin() async {
    Map<String, String> data = {'user_email': email, 'user_password': password};

    String response = await Api()
        .post('${Core.getInstance().apiEndpoint.toString()}auth/login', data);

    Map<String, dynamic> loginResponse = jsonDecode(response);
    if (loginResponse['success']) {
      Core.getInstance().login(loginResponse['token']);
    } else {
      print(loginResponse);
    }
  }

  //the passed in email and password
  String email = '';
  String password = '';

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
                        'Welcome!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        'Login to your Account Below',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      //email field
                      child: TextFormField(
                        onChanged: emailChanged,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
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
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
                      //password field
                      child: TextFormField(
                        onChanged: passwordChanged,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
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
                    Row(
                      children: <Widget>[
                        //submit credentials button
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FilledButton(
                            onPressed: () {
                              postLogin();
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        //forgot password button
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text('Forgot password?'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        //create account button
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: FilledButton(
                            onPressed: () {
                              setState(() {
                                Core.getInstance().changeLoginRoutePageIndex(1);
                              });
                            },
                            child:
                                const Text('Or you can create an account here'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
