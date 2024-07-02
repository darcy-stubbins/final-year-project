import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
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
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('Welcome!'),
                      subtitle: Text('Login to your account below'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
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
                        TextButton(
                          onPressed: () {
                            Core.getInstance().login();
                          },
                          child: const Text('Submit'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Core.getInstance().changeLoginRoutePageIndex(1);
                            });
                          },
                          child:
                              const Text('Or you can create an account here'),
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
