import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';

abstract class FamilyService {
  static Future requestJoinFamily(String code) async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(
        ApiRoutes.joinFamily,
        data: {
          "code": code,
        },
      );
     
      return response.statusCode;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future createFamily(String floor) async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(
        ApiRoutes.createFamily,
        data: {
          "floor": floor,
        },
      );
     
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }


   static Future checkIfParent() async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(
        ApiRoutes.isParent,
       
      );
     
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}

