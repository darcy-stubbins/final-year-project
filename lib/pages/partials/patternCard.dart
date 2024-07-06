import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class PatternCard extends StatefulWidget {
  final int id;
  final String name;
  const PatternCard({super.key, required this.id, required this.name});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(widget.name),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.star),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.thumb_up),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.chat_bubble),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FilledButton(
                    child: const Text('Open Pattern'),
                    onPressed: () {
                      Core.getInstance().openPatternDetails(widget.id);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
