class User {
  String id;
  String email;
  String first_name;
  String last_name;
  String profile_img;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.profile_img,
  });

  factory User.fromJson(Map json) {
    return User(
      id: json['_id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      profile_img:json['profile_img']
    );
  }
}
