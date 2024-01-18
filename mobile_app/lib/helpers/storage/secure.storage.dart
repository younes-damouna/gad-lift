import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> saveToken(String key, String value) async {
   
    await storage.write(key: key, value: value);
  }

  Future<String?> getToken(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteToken(String key) async {
    await storage.delete(key: key);
  }
}