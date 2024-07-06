// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/pages/partials/patternCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              // child: SearchBar(
              //   onChanged: searchBarChanged,
              //   hintText: 'Try searching for a pattern',
              //   hintStyle: WidgetStateProperty<TextStyle>(color: Colors.grey),
              // ),
              child: TextField(
                onChanged: searchBarChanged,
                decoration: InputDecoration(
                  hintText: "Try Searching for a Pattern",
                  hintStyle: Theme.of(context).textTheme.labelLarge,
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
            //passing in the PatternCard partial
            PatternCard(id: 1, name: 'Pattern Example 1'),
            PatternCard(id: 2, name: 'Pattern Example 2'),
            PatternCard(id: 3, name: 'Pattern Example 3')
          ],
        ),
      ),
    );
  }
}
