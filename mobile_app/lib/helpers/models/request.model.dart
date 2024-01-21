class Request {
  String id;
  String email;
  String first_name;
  String last_name;

  Request({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  factory Request.fromJson(Map json) {
    return Request(
      id: json['_id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }

  List<Request> parseProducts(List<Map> objects) {
    List<Request> list = [];
    for (Map object in objects) {
      final request = Request.fromJson(object);
      list.add(request);
    }
    return list;
  }
}
