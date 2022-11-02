class UserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String avatar;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.avatar,
      required this.lastname,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstname: json['first_name'],
        avatar: json['avatar'],
        lastname: json['last_name'],
        email: json['email']);
  }
}
