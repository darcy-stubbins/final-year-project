import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key});

  @override
  State<AccountCreated> createState() => _AccountCreated();
}

class _AccountCreated extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Account created'),
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
                          'Thanks for creating an account with us.',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text('We cant wait to see what you make!',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: FilledButton(
                              onPressed: () {
                                Core.getInstance().login();
                              },
                              child: const Text('Login with your new account'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
