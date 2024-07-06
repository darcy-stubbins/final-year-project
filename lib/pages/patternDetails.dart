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
      if (_counter >= 1) {
        // will stop at 0
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget counter;
    if (Core.getInstance().getCurrentCounterValue() != null) {
      counter = Card(
        margin: EdgeInsets.only(right: 80.0, left: 80.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 40.0),
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                backgroundColor: Colors.indigo,
                child: const Icon(Icons.remove),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                _counter.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 40.0),
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                backgroundColor: Colors.indigo,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
    } else {
      counter = Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FilledButton(
            onPressed: () {
              Core.getInstance().createCounter();
            },
            child: const Text('Add Counter'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Pattern Details',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 600,
              width: 350,
              child: Image.asset(
                'assets/images/pdf-placeholder.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          counter,
        ],
      ),
    );
  }
}
