class User {
  String id;
  String email;
  String first_name;
  String last_name;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  factory User.fromJson(Map json) {
    return User(
      id: json['_id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }
}
