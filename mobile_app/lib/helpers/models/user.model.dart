class User {
  String id;
  String email;
  String firstName;
  String lastName;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName});
  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
