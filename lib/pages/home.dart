import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/pages/partials/patternCard.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // function to return patterns for the homepage
  List<Widget> buildPatterns() {
    //hard coded json response
    List<dynamic> patterns = jsonDecode(
        '[{"id": 1,"pattern_name": "Jumper Pattern","user_id": 1,"pdf_path": "dictionary.pdf","user_name": "Darcy Stubbins"},{"id": 2,"pattern_name": "Dress Pattern","user_id": 1,"pdf_path": "dictionary.pdf","user_name": "Darcy Stubbins"},{"id": 3,"pattern_name": "Dress Pattern with Bow","user_id": 3,"pdf_path": "dictionary.pdf","user_name": "Jane Doe"},{"id": 4,"pattern_name": "Fleece Pattern","user_id": 3,"pdf_path": "dictionary.pdf","user_name": "Jane Doe"},{"id": 5,"pattern_name": "Knitted Vest","user_id": 6,"pdf_path": "dictionary.pdf","user_name": "Steve Stubbins"},{"id": 6,"pattern_name": "Crocheted Mini Dress","user_id": 7,"pdf_path": "dictionary.pdf","user_name": "John Smith"},{"id": 7,"pattern_name": "Tie (no sewing machine method)","user_id": 7,"pdf_path": "dictionary.pdf","user_name": "John Smith"},{"id": 8,"pattern_name": "Autumn Themed Blanket (single bed size)","user_id": 10,"pdf_path": "dictionary.pdf","user_name": "Sue Stubbins"},{"id": 9,"pattern_name": "Autumn Themed Blanket (double bed size)","user_id": 10,"pdf_path": "dictionary.pdf","user_name": "Sue Stubbins"},{"id": 10,"pattern_name": "Knitted Cardigan","user_id": 3,"pdf_path": "dictionary.pdf","user_name": "Jane Doe"}]');
    //checking if the pattern_name matches the passed in query from the user
    patterns = patterns.where((pattern) {
      Map<String, dynamic> castedPattern = pattern as Map<String, dynamic>;

      return castedPattern['pattern_name'].toLowerCase().contains(query);
    }).toList();

    //http json request - to post the request with the inserted query as search_term and then return
    // the response from the API function called searh in the Pattern class.
    //
    // final response = await http
    //   .post(
    //      Uri.parse('https://127.0.0.1/pattern/search'),
    //      body: jsonEncode(<String, String>{
    //        'search_term': this.query,
    //      })
    //    );
    // List<dynamic> patterns = jsonDecode(response.body);

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

  //the passed in query(search bar)
  String query = '';

  void searchBarChanged(String query) {
    setState(() {
      this.query = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> matchedPatterns = buildPatterns();

    //returns 'nothing found' if no patterns are found
    if (matchedPatterns.length == 0) {
      matchedPatterns.add(Text('Sorry, nothing found',
          style: Theme.of(context).textTheme.titleMedium));
    }

    return Scaffold(
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
                children: matchedPatterns,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
