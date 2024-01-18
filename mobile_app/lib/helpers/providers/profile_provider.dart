import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  
  ProfileProvider({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName

  });
}