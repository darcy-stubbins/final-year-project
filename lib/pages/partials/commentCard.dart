import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.comment.userName + ' left the comment:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                widget.comment.commentBody,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
