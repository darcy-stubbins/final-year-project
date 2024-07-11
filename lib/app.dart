import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/dashboard.dart';
import 'package:my_app/loginRoute.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/register.dart';
import './pages/home.dart';
import 'models/user.dart';

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

    //colours used in the theme data
    MaterialColor primaryColor = Colors.indigo;
    MaterialColor secondaryColor = Colors.indigo;
    MaterialColor tertiaryColor = Colors.indigo;

    return MaterialApp(
        title: 'Crafting App',
        //introducing the routes for the API
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/register': (context) => Register()
        },
        theme: ThemeData(
          //colour themes
          colorScheme: ColorScheme(
            primary: primaryColor,
            onPrimary: primaryColor.shade900,
            surface: primaryColor.shade200, //card colour**
            onSurface: Colors.white,
            secondary: secondaryColor.shade900,
            onSecondary: secondaryColor.shade900,
            tertiary: tertiaryColor.shade600,
            onTertiary: tertiaryColor.shade600,
            error: Colors.red,
            onError: Colors.red,
            //(deprecated but could not find alternatives in documentation)
            background: primaryColor.shade100,
            onBackground: primaryColor.shade100,
            brightness: Brightness.light,
            // backgroundColor: primaryColor.shade100,
          ),
          textTheme: TextTheme(
              //large title theme data
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor.shade900,
              ),
              //medium title theme data
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor.shade900,
              ),
              //small title theme data
              titleSmall: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor.shade900,
              ),
              //style for hint text
              labelLarge: TextStyle(
                color: primaryColor.shade900,
                fontSize: 16.0,
              ),
              //style for hint text (search bar)
              labelMedium: TextStyle(
                color: primaryColor.shade300,
                fontSize: 16.0,
              )),
          //button themes
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: primaryColor.shade700,
                foregroundColor: primaryColor.shade50,
                padding: EdgeInsets.all(10.0)),
          ),
          //button theme (counter buttons)
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor.shade900,
            foregroundColor: primaryColor.shade50,
          ),
          //icon themes
          iconTheme: IconThemeData(
            color: primaryColor.shade50,
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
