import 'dart:io';

import 'package:dio/dio.dart';

final BaseOptions options = BaseOptions(
  baseUrl: "http://192.168.0.107:3000",
  // baseUrl: "http://192.168.0.105:3000",

  // baseUrl: 'http://192.168.44.152:3000',
  contentType: Headers.jsonContentType,
  
 
);
final Dio dio = Dio(options);
