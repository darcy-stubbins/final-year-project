// ignore_for_file: prefer_const_constructors

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
              title: Text(
                widget.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //star icon
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.star,
                    color: Theme.of(context).iconTheme.color,
                    //sizing up from theme for better look
                    size: 28.0,
                  ),
                ),
                //thumbs up icon
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.thumb_up,
                    color: Theme.of(context).iconTheme.color,
                    //sizing up from theme for better look
                    size: 26.0,
                  ),
                ),
                //chat bubble icon with modal functionality
                TextButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Comments',
                          style: Theme.of(context).textTheme.titleLarge),
                      content: Text('There are no comments yet',
                          style: Theme.of(context).textTheme.titleSmall),
                      actions: <Widget>[
                        FilledButton(
                          onPressed: () => Navigator.pop(context, 'Close'),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.chat_bubble,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            //open pattern button and functionality
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
