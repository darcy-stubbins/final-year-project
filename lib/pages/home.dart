import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/pages/partials/patternCard.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //function to return patterns for the homepage
  List<Widget> buildPatterns() {
    List<dynamic> patterns = jsonDecode(
        '[{"id": 1,"pattern_name": "pattern 1","pdf_path": "https://mycoolpatternpdf.com "},{"id": 2,"pattern_name": "pattern 2","pdf_path": "https://mycoolpatternpdf.com "},{"id": 3,"pattern_name": "pattern 3","pdf_path": "https://mycoolpattern123pdf.com "},{"id": 4,"pattern_name": "pattern 4","pdf_path": "https://mycoolpattern123456789pdf.com "},{"id": 5,"pattern_name": "pattern 5","pdf_path": "bsdhbgjsbgjbs"},{"id": 6,"pattern_name": "pattern 6","pdf_path": "bsdhbgjsbgjbs"},{"id": 7,"pattern_name": "pattern 7","pdf_path": "bsdhbgjsbgjbs"}]');
    //create an empty list of widgets
    List<Widget> patternWidgets = <Widget>[];
    //loop that will get each pattern and add it to a pattern card
    patterns.forEach((patternMap) {
      Pattern pattern = Pattern.fromJson(patternMap as Map<String, dynamic>);
      patternWidgets.add(PatternCard(pattern: pattern));
    });
    //returning the list of pattern cards
    return patternWidgets;
  }

  //search bar functionality
  List<String> options = [
    'One',
    'Two',
    'Three',
    'Four',
  ];

  List<String> searchResults = [];

  void searchBarChanged(String query) {
    setState(() {
      searchResults = options
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                //search bar
                child: TextField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  onChanged: searchBarChanged,
                  decoration: InputDecoration(
                    hintText: "Try Searching for a Pattern",
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Column(
                //pattern card displaying
                children: this.buildPatterns(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
