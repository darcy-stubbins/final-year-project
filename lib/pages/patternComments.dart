import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';
import 'package:my_app/pages/partials/commentCard.dart';
import 'package:my_app/pages/partials/patternCard.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:pdfrx/pdfrx.dart';

class PatternComments extends StatefulWidget {
  const PatternComments({super.key});

  @override
  State<PatternComments> createState() => _PatternCommentsState();
}

class _PatternCommentsState extends State<PatternComments> {
  // function to return comments associated with the opened pattern
  Future<List<Widget>> buildComments() async {
    //hitting the api
    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}pattern/get-pattern-comments/${Core.getInstance().getCurrentPatternId().toString()}',
        {});

    List<dynamic> comments = jsonDecode(response);

    //create an empty list of widgets
    List<Widget> commentWidgets = <Widget>[];
    //loop that will get each comment and add it to the widget
    comments.forEach((commentMap) {
      Comment comment = Comment.fromJson(commentMap as Map<String, dynamic>);
      commentWidgets.add(CommentCard(comment: comment));
    });
    //returning the list of comments
    return commentWidgets;
  }

  void postComment() async {
    if (commentBody.isEmpty) {
      return;
    }
    Map<String, String> data = {
      'comment_body': this.commentBody,
      'pattern_id': Core.getInstance().getCurrentPatternId().toString(),
      //hardoded user as no login system
      'user_id': '1'
    };
    //hitting the api
    String response = await Api().post(
        '${Core.getInstance().apiEndpoint.toString()}pattern/post-pattern-comment',
        data);
  }

  //the passed in query(search bar)
  String commentBody = '';

  void commentBodyChange(String commentBody) {
    setState(() {
      this.commentBody = commentBody;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //comment displaying using a future builder
      body: FutureBuilder<List<Widget>>(
        future: buildComments(),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //returns 'nothing found' if no comments are found
            List<Widget> matchedComments = snapshot.data ?? [];
            if (matchedComments.length == 0) {
              matchedComments.add(Text('Sorry, nothing found',
                  style: Theme.of(context).textTheme.titleMedium));
            }
            // data loaded:
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        //pattern card displaying
                        children: matchedComments ?? [],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      //comment leaving section
                      child: TextFormField(
                        onChanged: commentBodyChange,
                        minLines: 1,
                        maxLines: 8,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                        decoration: InputDecoration(
                          hintText: "Leave a comment here",
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: FilledButton(
                        onPressed: () {
                          postComment();
                        },
                        child: const Text('Post Comment'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
