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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: const Column(
        children: <Widget>[
          PatternCard(),
          PatternCard(),
        ],
      ),
    );
  }
}
