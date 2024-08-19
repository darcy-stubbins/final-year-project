import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:pdfrx/pdfrx.dart';

class PatternDetails extends StatefulWidget {
  const PatternDetails({super.key});

  @override
  State<PatternDetails> createState() => _PatternDetailsState();
}

class _PatternDetailsState extends State<PatternDetails> {
  //returing the patterns PDF
  Widget getPDF() {
    var pdf = PdfViewer.asset('assets/PDFs/dictionary.pdf');
    return pdf;
  }

  //counter logic
  int _counter = 0;

  //+ counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //- counter
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
            //- counter button
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 40.0),
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: const Icon(Icons.remove),
              ),
            ),
            //displayed current counter number
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                _counter.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            //+ counter button
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 40.0),
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
    } else {
      //add counter button
      counter = Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FilledButton(
            onPressed: () {
              Core.getInstance().createCounter();
            },
            child: Text('Add Counter'),
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
              child: getPDF(),
            ),
          ),
          counter,
        ],
      ),
    );
  }
}
