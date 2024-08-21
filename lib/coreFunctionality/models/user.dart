class User {
  final int id;
  final String userName;
  final String userEmail;
  final String userPassword;

  //constructor
  User(this.id, this.userName, this.userEmail, this.userPassword);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        userName = json['user_name'] as String,
        userEmail = json['user_email'] as String,
        userPassword = json['user_password'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_name': userName,
        'user_email': userEmail,
        'user_password': userPassword,
      };
}
