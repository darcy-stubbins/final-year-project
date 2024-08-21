import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/patternCard.dart';
// import 'package:http/http.dart' as http;

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
        '[{"id": 3,"pattern_name": "Dress Pattern with Bow ","pdf_path": "dictionary.pdf","user_name": "Jane Doe"},{"id": 7,"pattern_name": "Tie (no sewing machine method)","pdf_path": "dictionary.pdf","user_name": "John Smith"},{"id": 10,"pattern_name": "Knitted Cardigan","pdf_path": "dictionary.pdf","user_name": "Jane Doe"}]');

    //http json request - to get the current users saved patterns from the API function called getSavedPatterns in
    // the User class.
    //
    // final response = await http
    // .get(Uri.parse('https://127.0.0.1/user/get-saved-patterns'));
    // return Widget.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

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
