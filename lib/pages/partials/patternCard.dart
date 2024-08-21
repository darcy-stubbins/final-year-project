import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/coreFunctionality/core.dart';
import 'package:my_app/coreFunctionality/models/comment.dart';
import 'package:my_app/coreFunctionality/models/pattern.dart';
import 'package:my_app/pages/partials/commentCard.dart';
// import 'package:http/http.dart' as http;

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

  //function to return a patterns comments
  List<Widget> buildComments() {
    List<dynamic> commentsList = jsonDecode(
        '[{"id": 1,"pattern_id": 2,"user_id": 3,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "Jane Doe"},{"id": 2,"pattern_id": 2,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Velit ornare integer, fringilla fames montes rutrum dolor. Arcu dapibus sagittis proin vitae tempus neque fusce. Mauris dictum netus efficitur dis at sapien. Viverra nisi maecenas conubia taciti scelerisque at elementum. Vulputate primis molestie fermentum neque ex phasellus. Condimentum iaculis posuere mus etiam ante parturient primis mus. Facilisi tempor inceptos ultrices velit conubia venenatis. Dapibus lectus hendrerit ac finibus ultrices auctor.","user_name": "Dee Stubbins"},{"id": 3,"pattern_id": 8,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Finibus cras id cras pellentesque integer dolor ultricies dis. Nisl duis urna lacus lacinia mauris purus.","user_name": "Dee Stubbins"},{"id": 4,"pattern_id": 1,"user_id": 1,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Finibus cras id cras pellentesque integer dolor ultricies dis. Nisl duis urna lacus lacinia mauris purus.","user_name": "Darcy Stubbins"},{"id": 5,"pattern_id": 5,"user_id": 7,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "John Smith"},{"id": 6,"pattern_id": 5,"user_id": 8,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit.","user_name": "Adam Smith"},{"id": 7,"pattern_id": 9,"user_id": 1,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Pharetra inceptos congue erat montes mi morbi ridiculus donec pellentesque.","user_name": "Darcy Stubbins"},{"id": 8,"pattern_id": 2,"user_id": 2,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Pharetra inceptos congue erat montes mi morbi ridiculus donec pellentesque.","user_name": "John Doe"},{"id": 9,"pattern_id": 3,"user_id": 5,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Auctor odio vestibulum laoreet, sagittis tincidunt senectus efficitur senectus. Cras dignissim at eget eget, consectetur litora erat. Convallis nam at magna blandit mi. Sapien augue suspendisse metus metus adipiscing in nascetur faucibus. Nunc himenaeos enim dui nunc praesent diam purus potenti. Auctor erat cursus ullamcorper, ligula tempor eget. Ullamcorper cursus conubia, augue eros tortor conubia. Ridiculus hac mus inceptos non malesuada commodo nibh. Quisque himenaeos maximus convallis velit facilisis tincidunt torquent dui.","user_name": "Dee Stubbins"},{"id": 10,"pattern_id": 3,"user_id": 2,"comment_body": "Lorem ipsum odor amet, consectetuer adipiscing elit. Auctor odio vestibulum laoreet, sagittis tincidunt senectus efficitur senectus. Cras dignissim at eget eget, consectetur litora erat. Convallis nam at magna blandit mi. Sapien augue suspendisse metus metus adipiscing in nascetur faucibus. Nunc himenaeos enim dui nunc praesent diam purus potenti. Auctor erat cursus ullamcorper, ligula tempor eget. Ullamcorper cursus conubia, augue eros tortor conubia. Ridiculus hac mus inceptos non malesuada commodo nibh. Quisque himenaeos maximus convallis velit facilisis tincidunt torquent dui.","user_name": "John Doe"}]');
    //checking if the pattern_id passed in matches the selected pattern to return that patterns comments
    commentsList = commentsList.where((comment) {
      Map<String, dynamic> castedComment = comment as Map<String, dynamic>;
      return castedComment['pattern_id'] == this.widget.pattern.id;
    }).toList();

    //http json request
    // final response = await http
    // .get(Uri.parse('https://127.0.0.1/pattern/get-pattern-comments'));
    // List<dynamic> commentsList = Widget.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

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
    List<Widget> matchedComments = buildComments();

    if (matchedComments.length == 0) {
      matchedComments.add(Text('Sorry, no comments found',
          style: Theme.of(context).textTheme.titleSmall));
    }

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
                          children: matchedComments,
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
