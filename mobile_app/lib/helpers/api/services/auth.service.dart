import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';

abstract class AuthService {
  static Future login(String email, String password) async {
    try {
      final response = await dio.post(ApiRoutes.login, data: {
        "email": email,
        "password": password,
      });
      log(response as String);
    } on DioException catch (e) {
      log(e as String);
    }
  }

  static Future register(
      String firstName, String lastName, String email, String password) async {
      
    try {
      final response = await dio.post(ApiRoutes.register, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      });
      return response.data;
      // log(response.statusCode as String);
    } on DioException catch (e) {
      String? message=e.message;
      // log('error: $message');
      return message;
    }
  }
}
