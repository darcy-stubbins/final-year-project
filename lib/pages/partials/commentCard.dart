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
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            widget.comment.userName + ' left the comment:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            widget.comment.commentBody,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Divider(
          height: 1,
          color: Colors.indigo.shade900,
          thickness: 1,
        ),
      ],
    );
  }
}
