class Member {
  String id;
  String email;
  String first_name;
  String last_name;

  Member({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  factory Member.fromJson(Map json) {
    return Member(
      id: json['_id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }

  static List <Member> parseMembers(List objects) {
    List<Member> list = [];
    for (Map object in objects) {
      final request = Member.fromJson(object);
      list.add(request);
    }
    return list;
  }
}
