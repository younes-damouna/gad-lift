import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/models/member.model.dart';

class MemberProvider with ChangeNotifier {
  List<Member> members;

  MemberProvider({this.members = const []});

  void getMembers(List<Member> mem) {
    members = mem;

    notifyListeners();
  }
}
