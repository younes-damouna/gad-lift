import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';

abstract class UserService {
  static Future updateUser(
    String? firstName,
    String? lastName,
    String? email,
  ) async {
    try {
      final header = {
        HttpHeaders.authorizationHeader: '',
      };
      dio.options.headers = header;
      final response = await dio.post(ApiRoutes.profile, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      });
      log(response.statusCode as String);

      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
