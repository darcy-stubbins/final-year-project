import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/dashboard.dart';
import 'package:my_app/loginRoute.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    Widget access;
    Core.getInstance().setChangeAppState(appSetState);

    if (Core.getInstance().loggedIn) {
      access = Dashboard();
    } else {
      access = LoginRoute();
    }

    return MaterialApp(
        theme: ThemeData(
          //colour themes
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo,
            cardColor: const Color.fromRGBO(197, 203, 227, 1),
            accentColor: const Color.fromRGBO(64, 86, 161, 1),
            backgroundColor: const Color.fromRGBO(239, 226, 186, 1),
          ),
          textTheme: const TextTheme(
            //large title theme data
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            //medium title theme data
            titleMedium: TextStyle(
              color: Colors.deepOrange,
            ),
            //small title theme data
            titleSmall: TextStyle(
              color: Colors.purple,
            ),
            //style for hint text
            labelLarge: TextStyle(
              color: Colors.grey,
            ),
          ),
          //button themes
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.indigo,
                padding: EdgeInsets.all(10.0)),
          ),
          //icon themes
          iconTheme: IconThemeData(
            color: Colors.green,
            size: 24.0,
          ),
        ),

        //LoginRoute or App
        home: access);
  }

  void appSetState() {
    setState(() {});
  }
}
