import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';

abstract class UserService {
  static Future updateUser(String? firstName, String? lastName, String? email,
      String id, XFile? pickedFile) async {
    try {
      FormData formData = FormData();
      if (pickedFile != null) {
        formData = FormData.fromMap({
          "profile_img": await MultipartFile.fromFile(pickedFile.path,
              filename:
                  pickedFile.name.toString().replaceAll(' ', '').toLowerCase()),
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
        });
      } else {
        formData = FormData.fromMap({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
        });
      }

      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.post(
        '${ApiRoutes.profile}/$id',
        data: formData,
      );
     
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
