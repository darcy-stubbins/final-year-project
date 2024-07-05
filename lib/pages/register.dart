import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Register'),
      // ),
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
                      TextFormField(
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
                      TextFormField(
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
                      TextFormField(
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
                      TextFormField(
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
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FilledButton(
                              onPressed: () {
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
