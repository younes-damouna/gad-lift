import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/models/user.model.dart';

class ProfileProvider with ChangeNotifier {
  String id;
  String email;
  String firstName;
  String lastName;

  ProfileProvider({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  void getProfile(User user) {
    id = user.id;
    email = user.email;
    firstName = user.first_name;
    lastName = user.last_name;

    notifyListeners();
  }
}
