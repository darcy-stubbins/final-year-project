import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/patternCard.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  //function to return saved patterns in a list of pattern cards
  List<Widget> buildSavedPatterns() {
    //decoding the json
    List<dynamic> patterns = jsonDecode(
        '[{"id": 1,"pattern_name": "mycoolpattern1","pdf_path": "bsdhbgjsbgjbs","user_name": "chripy"},{"id": 3,"pattern_name": "mycoolpattern3","pdf_path": "bsdhbgjsbgjbs","user_name": "chripy"},{"id": 7,"pattern_name": "mycoolpattern7","pdf_path": "bsdhbgjsbgjbs","user_name": "deeeeeeeee"}]');
    //create empty widget list
    List<Widget> widgets = <Widget>[];
    //loop that will get each pattern and add it to a pattern card
    patterns.forEach((patternMap) {
      Pattern pattern = Pattern.fromJson(patternMap as Map<String, dynamic>);
      widgets.add(PatternCard(pattern: pattern));
    });
    //returning the list of pattern cards
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    buildSavedPatterns();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Your Saved Patterns',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      //pattern card displaying
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: this.buildSavedPatterns(),
          ),
        ),
      ),
    );
  }
}
