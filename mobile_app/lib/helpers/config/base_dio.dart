import 'package:dio/dio.dart';

final BaseOptions options = BaseOptions(
  baseUrl: "http://192.168.0.107:3000",
  // baseUrl: "http://192.168.83.46:3000",
  contentType: Headers.jsonContentType,
);
final Dio dio = Dio(options);
