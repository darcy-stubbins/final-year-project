import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
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
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          SearchBar(onChanged: searchBarChanged),
          //passing in the PatternCard partial
          const PatternCard(),
          const PatternCard(),
          const PatternCard()
        ],
      ),
    );
  }
}
