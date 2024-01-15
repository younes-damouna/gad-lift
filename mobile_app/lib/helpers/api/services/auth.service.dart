
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';

abstract class AuthService{
static Future login(String email,String password) async{
try {
    final response= await dio.post(ApiRoutes.login,data: {
    "email":email,
    "password":password
  });
  log(response as String);
} on DioException catch(e) {
  log(e as String);
}

}
}