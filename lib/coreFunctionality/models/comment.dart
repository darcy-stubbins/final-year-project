class Comment {
  final int id;
  final int patternId;
  final int userId;
  final String commentBody;
  final String userName;

  //constructor
  Comment(
      this.id, this.patternId, this.userId, this.commentBody, this.userName);

  //mapping the parsed in json elements (id, patternid, userid, and comment body) to a map
  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        patternId = json['pattern_id'] as int,
        userId = json['user_id'] as int,
        commentBody = json['comment_body'] as String,
        userName = json['user_name'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'pattern_id': patternId,
        'user_id': userId,
        'comment_body': commentBody,
        'user_name': userName,
      };
}
