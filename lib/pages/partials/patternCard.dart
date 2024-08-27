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
  //initialising the icon colour variables for fave and like icon
  late Color? favIconColor = Theme.of(context).iconTheme.color;
  late Color? likeIconColor = Theme.of(context).iconTheme.color;

  @override
  Widget build(BuildContext context) {
    //calling the color variables
    favIconColor;
    likeIconColor;
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
              subtitle: Text(
                'Posted by ' + widget.pattern.patternAuthor,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //star icon
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    icon: Icon(
                      Icons.star,
                      color: favIconColor,
                      size: 26,
                    ),
                    //changing the icon colours based on clicked
                    onPressed: () {
                      setState(() {
                        if (favIconColor == Theme.of(context).iconTheme.color) {
                          favIconColor = Colors.indigo.shade900;
                        } else {
                          favIconColor = Theme.of(context).iconTheme.color;
                        }
                      });
                    },
                  ),
                ),
                //thumbs up icon
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: likeIconColor,
                      size: 24,
                    ),
                    //changing the icon colours based on clicked
                    onPressed: () {
                      setState(() {
                        if (likeIconColor ==
                            Theme.of(context).iconTheme.color) {
                          likeIconColor = Colors.indigo.shade900;
                        } else {
                          likeIconColor = Theme.of(context).iconTheme.color;
                        }
                      });
                    },
                  ),
                ),
                //chat bubble icon which will open to a new page to display the patterns comments
                TextButton(
                  onPressed: () {
                    Core.getInstance().openCommentCard(widget.pattern.id);
                  },
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
