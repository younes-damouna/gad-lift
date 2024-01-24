import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';

abstract class UserService {
  static Future updateUser(
      String? firstName, String? lastName, String? email, String id) async {
    try {
      final storage = SecureStorage();

      final token = await storage.getToken('access_token');
      final header = {
        HttpHeaders.authorizationHeader: token,
      };
      dio.options.headers = header;
      final response = await dio.patch(
        '${ApiRoutes.profile}/$id',
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
        },
        // queryParameters: {"id":id}
      );
      log(response.statusCode as String);
      log('response : ${response.data}');
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future<void> changeImage(XFile? pickedFile) async {
    DateTime now = DateTime.now();

    if (pickedFile != null) {
      FormData formData = FormData.fromMap({
        "profile_img": await MultipartFile.fromFile(pickedFile.path,
            filename: now.toString()),
      });

      final response = await dio.post(ApiRoutes.profile, data: formData);

      if (response.statusCode == 200) {
        log('200');

        // return '${response.statusMessage}';
      } else {
        log('response');

        // return 'Image upload failed!';
      }
    }
  }
}
