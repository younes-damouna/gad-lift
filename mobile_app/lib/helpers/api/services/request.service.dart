import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';

abstract class RequestService {
  static Future getRequests() async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(
        ApiRoutes.getRequests,
      );
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future acceptMember(String id) async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(ApiRoutes.acceptMember, data: {"id": id});
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
