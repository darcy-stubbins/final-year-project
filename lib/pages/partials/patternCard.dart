import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';

class PatternCard extends StatefulWidget {
  const PatternCard({super.key});

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
            const ListTile(
              title: Text('Pattern name'),
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
                TextButton(
                  child: const Text('Open pattern'),
                  onPressed: () {
                    Core.getInstance().changeDashboardPageIndex(3); 
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
