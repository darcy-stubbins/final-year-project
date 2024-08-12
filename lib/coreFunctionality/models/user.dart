class User {
  final String userName;
  final String userEmail;
  final String userPassword;

  //constructor
  User(this.userName, this.userEmail, this.userPassword);

  User.fromJson(Map<String, dynamic> json)
      : userName = json['user_name'] as String,
        userEmail = json['user_email'] as String,
        userPassword = json['user_password'] as String;

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'user_email': userEmail,
        'user_password': userPassword,
      };
}
