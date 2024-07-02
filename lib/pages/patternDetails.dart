
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class PatternDetails extends StatefulWidget {
  const PatternDetails({super.key});

  @override
  State<PatternDetails> createState() => _PatternDetailsState();
}

class _PatternDetailsState extends State<PatternDetails> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget counter;
    if (Core.getInstance().displayCounter) {
      counter = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(_counter.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      );
    } else {
      counter = Center(
        child: TextButton(
          onPressed: () {
            Core.getInstance().changeDisplayCounter(true);
          },
          child: const Text('Add counter'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pattern details'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/pdf-placeholder.jpg'),
          ),
          counter,
        ],
      ),
    );
  }
}
