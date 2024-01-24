import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/models/request.model.dart';

class MemberProvider with ChangeNotifier {
  List<Member> requests;

  MemberProvider({this.requests = const []});

  void getMembers(List<Member> req) {
    requests = req;

    notifyListeners();
  }
}
