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
      appBar: AppBar(
        title: const Text('Account created'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Card(
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('Thanks for creating an account with us..'),
                      subtitle: Text('We cant wait to see what you make!'),
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Core.getInstance().login();
                          },
                          child: const Text('Login with your new account'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
