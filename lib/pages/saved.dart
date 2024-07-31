import 'package:flutter/material.dart';
import 'package:my_app/pages/partials/patternCard.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Your Saved Patterns',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      //pattern card displaying
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            //passing in the PatternCard partial
            PatternCard(id: 1, name: 'Pattern Example 1'),
            PatternCard(id: 2, name: 'Pattern Example 2'),
          ],
        ),
      ),
    );
  }
}
