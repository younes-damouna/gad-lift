class User {
  String id;
  String email;
  String first_name;
  String last_name;
  String profile_img;
  String mobile_number;

  User(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.profile_img,
      required this.mobile_number});

  factory User.fromJson(Map json) {
    return User(
        id: json['_id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        mobile_number: json['mobile_number'],
        profile_img: json['profile_img']);
  }
}
