import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/patternCard.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  //function to return saved patterns in a list of pattern cards
  Future<List<Widget>> buildSavedPatterns() async {
    //decoding the json (hardcoded)
    // List<dynamic> patterns = jsonDecode(
    //     '[{"id": 3,"pattern_name": "Dress Pattern with Bow ","pdf_path": "dictionary.pdf","user_name": "Jane Doe"},{"id": 7,"pattern_name": "Tie (no sewing machine method)","pdf_path": "dictionary.pdf","user_name": "John Smith"},{"id": 10,"pattern_name": "Knitted Cardigan","pdf_path": "dictionary.pdf","user_name": "Jane Doe"}]');

    //getting the response from the API and decoding it
    String response =
        await Api().get('https://10.0.2.2/user/get-saved-patterns/1');

    List<dynamic> patterns = jsonDecode(response);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Your Saved Patterns',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      //pattern card displaying using a future builder
      body: FutureBuilder<List<Widget>>(
        future: buildSavedPatterns(),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // data loaded:
            var savedPatterns = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: savedPatterns ?? [],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
