import 'package:flutter/material.dart';
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
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color.fromRGBO(110, 138, 115, 1),
        //     brightness: Brightness.dark,
        //   ),
        // ),

        //LoginRoute or App
        // home: access);

        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        //LoginRoute or App
        home: access);
  }

  void appSetState() {
    setState(() {});
  }
}
