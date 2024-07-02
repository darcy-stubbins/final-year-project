import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/pages/accountCreated.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/register.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {

  @override
  Widget build(BuildContext context) {
    // list of screens used for the index linking to files
    final List<Widget> screens = [
      const Login(),
      const Register(),
      const AccountCreated(),
    ];

    return screens.elementAt(Core.getInstance().loginRoutePageIndex); 
  }
}
