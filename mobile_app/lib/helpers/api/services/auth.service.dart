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
      // log('response: ${response.data['user']}');
      // if (response.statusCode == 200) {
        //  return response.data;
          return {
          "user":response.data['user'],
           "statusCode":response.statusCode,
           'access_token':response.data['access_token']
         };

  // } 
  // return {response.data};
    } on DioException catch (e) {
      return { "response":"",
        "statusCode": e.response?.statusCode,
        "statusMessage":e.response?.data['message']
      };
    }
  }

  static Future register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(ApiRoutes.register, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      });
      log('codeing ${response.statusCode}');

      return response.statusCode;
    } on DioException catch (e) {
     
           return e.response?.statusCode;

    }
  }
}
