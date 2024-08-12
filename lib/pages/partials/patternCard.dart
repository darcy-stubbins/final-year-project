import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/commentCard.dart';

class PatternCard extends StatefulWidget {
  final Pattern pattern;
  const PatternCard({super.key, required this.pattern});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  //function to return a patterns comments
  List<Widget> buildComments() {
    List<dynamic> commentsList = jsonDecode(
        '[{"id": 5,"pattern_id": 2,"user_id": 2,"comment_body": "look at this comment","user_name": "darcy"},{"id": 6,"pattern_id": 2,    "user_id": 4,"comment_body": "second comment","user_name":"chrispy"},{"id": 7,"pattern_id": 2,"user_id": 2,"comment_body": "look at this comment1","user_name": "darcy"},{"id": 8,"pattern_id": 2,"user_id": 2,"comment_body": "look at this comment2","user_name": "darcy"},{"id": 9,"pattern_id": 2,"user_id": 2,"comment_body": "look at this comment3","user_name": "darcy"}]');
    //create an empty list of widgets
    List<Widget> commentWidgets = <Widget>[];
    //iterate over the comments and add them to a comments card
    commentsList.forEach((commentMap) {
      Comment comment = Comment.fromJson(commentMap as Map<String, dynamic>);
      commentWidgets.add(CommentCard(
        comment: comment,
      ));
    });
    return commentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.pattern.patternName,
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
                      //making it scrollable
                      content: SingleChildScrollView(
                        child: Column(
                          children: this.buildComments(),
                        ),
                      ),
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
                      Core.getInstance().openPatternDetails(widget.pattern.id);
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
