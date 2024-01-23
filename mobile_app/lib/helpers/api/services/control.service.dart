import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';

abstract class ControlService {
  static Future control(
     String action) async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      // dio.options.headers = header;
      final response = await dio.get(
        '${ApiRoutes.profile}/$action',
       
        // queryParameters: {"id":id}
      );
      log(response.statusCode as String);
      log('response : ${response.data}');
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
