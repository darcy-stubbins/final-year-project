import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/api.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';
import 'package:my_app/pages/partials/commentCard.dart';
import 'package:my_app/pages/partials/patternCard.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';

class PatternComments extends StatefulWidget {
  const PatternComments({super.key});

  @override
  State<PatternComments> createState() => _PatternCommentsState();
}

class _PatternCommentsState extends State<PatternComments> {
  // function to return comments associated with the opened pattern
  Future<List<Widget>> buildComments() async {
    //decoding the json (hardcoded)
    // List<dynamic> comments = jsonDecode(
    //     '[{"id": 1,"pattern_id": 2,"user_id": 3,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "Jane Doe"},{"id": 2,"pattern_id": 2,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Velit ornare integer, fringilla fames montes rutrum dolor. Arcu dapibus sagittis proin vitae tempus neque fusce. Mauris dictum netus efficitur dis at sapien. Viverra nisi maecenas conubia taciti scelerisque at elementum. Vulputate primis molestie fermentum neque ex phasellus. Condimentum iaculis posuere mus etiam ante parturient primis mus. Facilisi tempor inceptos ultrices velit conubia venenatis. Dapibus lectus hendrerit ac finibus ultrices auctor.","user_name": "Dee Stubbins"},{"id": 3,"pattern_id": 8,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Finibus cras id cras pellentesque integer dolor ultricies dis. Nisl duis urna lacus lacinia mauris purus.","user_name": "Dee Stubbins"},{"id": 4,"pattern_id": 1,"user_id": 1,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Finibus cras id cras pellentesque integer dolor ultricies dis. Nisl duis urna lacus lacinia mauris purus.","user_name": "Darcy Stubbins"},{"id": 5,"pattern_id": 5,"user_id": 7,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "John Smith"},{"id": 6,"pattern_id": 5,"user_id": 8,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "Adam Smith"},{"id": 7,"pattern_id": 9,"user_id": 1,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Pharetra inceptos congue erat montes mi morbi ridiculus donec pellentesque.","user_name": "Darcy Stubbins"},{"id": 8,"pattern_id": 2,"user_id": 2,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Pharetra inceptos congue erat montes mi morbi ridiculus donec pellentesque.","user_name": "John Doe"},{"id": 9,"pattern_id": 3,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Auctor odio vestibulum laoreet, sagittis tincidunt senectus efficitur senectus. Cras dignissim at eget eget, consectetur litora erat. Convallis nam at magna blandit mi. Sapien augue suspendisse metus metus adipiscing in nascetur faucibus. Nunc himenaeos enim dui nunc praesent diam purus potenti. Auctor erat cursus ullamcorper, ligula tempor eget. Ullamcorper cursus conubia, augue eros tortor conubia. Ridiculus hac mus inceptos non malesuada commodo nibh. Quisque himenaeos maximus convallis velit facilisis tincidunt torquent dui.","user_name": "Dee Stubbins"},{"id": 10,"pattern_id": 3,"user_id": 2,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Auctor odio vestibulum laoreet, sagittis tincidunt senectus efficitur senectus. Cras dignissim at eget eget, consectetur litora erat. Convallis nam at magna blandit mi. Sapien augue suspendisse metus metus adipiscing in nascetur faucibus. Nunc himenaeos enim dui nunc praesent diam purus potenti. Auctor erat cursus ullamcorper, ligula tempor eget. Ullamcorper cursus conubia, augue eros tortor conubia. Ridiculus hac mus inceptos non malesuada commodo nibh. Quisque himenaeos maximus convallis velit facilisis tincidunt torquent dui.","user_name": "John Doe"}]');

    //hitting the api
    String response = await Api().get(
        'https://10.0.2.2/pattern/get-pattern-comments/${Core.getInstance().getCurrentPatternId().toString()}');

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
    Map<String, String> data = {
      'comment_body': this.commentBody,
      'pattern_id': Core.getInstance().getCurrentPatternId().toString(),
      //hardoded user as no login system
      'user_id': '2'
    };
    //hitting the api
    String response =
        await Api().post('https://10.0.2.2/pattern/post-pattern-comment', data);
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
                      child: TextField(
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
