import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/commentCard.dart';

class PatternCard extends StatefulWidget {
  final Pattern pattern;
  int? saved;
  int? liked;
  PatternCard({super.key, required this.pattern, this.saved, this.liked});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  //initialising the icon colour variables for fave and like icon
  late Color? favIconColor = Theme.of(context).iconTheme.color;
  late Color? likeIconColor = Theme.of(context).iconTheme.color;

  @override
  Widget build(BuildContext context) {
    //save icon
    if (widget.saved == 1) {
      favIconColor = Colors.indigo.shade900;
    } else {
      favIconColor = Theme.of(context).iconTheme.color;
    }
    //like icon
    if (widget.liked == 1) {
      likeIconColor = Colors.indigo.shade900;
    } else {
      likeIconColor = Theme.of(context).iconTheme.color;
    }
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
                //star icon (saved)
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
                        //hitting the api
                        Api().post(
                            '${Core.getInstance().apiEndpoint.toString()}user/post-save-pattern',
                            {
                              'user_id': '1',
                              'pattern_id': widget.pattern.id.toString()
                            });
                        widget.saved = widget.saved == 1 ? 0 : 1;
                        if (widget.saved == 1) {
                          favIconColor = Colors.indigo.shade900;
                        } else {
                          favIconColor = Theme.of(context).iconTheme.color;
                        }
                      });
                    },
                  ),
                ),
                //thumbs up icon (liked)
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
                        //hitting the api
                        Api().post(
                            '${Core.getInstance().apiEndpoint.toString()}pattern/post-pattern-like',
                            {
                              'user_id': '1',
                              'pattern_id': widget.pattern.id.toString()
                            });
                        widget.liked = widget.liked == 1 ? 0 : 1;
                        if (widget.liked == 1) {
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
