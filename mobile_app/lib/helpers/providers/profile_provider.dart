import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/models/user.model.dart';

class ProfileProvider with ChangeNotifier {
  String id;
  String email;
  String firstName;
  String lastName;
    String profile_img;


  ProfileProvider({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profile_img,
  });

  void getProfile(User user) {
    id = user.id;
    email = user.email;
    firstName = user.first_name;
    lastName = user.last_name;
    profile_img=user.profile_img;

    notifyListeners();
  }
}
