import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: false,
      );
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> saveToken(String key, String value) async {
    await storage.write(
        key: key, value: 'Bearer $value', aOptions: const AndroidOptions());
  }

  Future<String?> getToken(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteToken(String key) async {
    await storage.delete(key: key);
  }
}
