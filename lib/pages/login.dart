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
                    TextFormField(
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
                    TextFormField(
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
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FilledButton(
                            onPressed: () {
                              Core.getInstance().login();
                            },
                            child: const Text('Submit'),
                          ),
                        ),
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
