import 'package:flutter/material.dart';
import 'package:my_app/pages/partials/patternCard.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Your saved patterns',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            PatternCard(),
            PatternCard(),
          ],
        ),
      ),
    );
  }
}
