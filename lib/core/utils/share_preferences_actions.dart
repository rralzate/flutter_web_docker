import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharePreferencesAction {
  static Future<String> getActionFromSecureStorage({
    required String key,
  }) async {
    String? result = "";
    try {
      const storage = FlutterSecureStorage();
      if (await storage.containsKey(key: key)) {
        result = await storage.read(key: key);
      }
    } catch (e) {
      throw Exception(e);
    }
    return result!;
  }

  static Future<void> setActionFromSecureStorage({
    required String key,
    required String value,
  }) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: key, value: value);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> deleteActionFromSecureStorage({
    required String key,
  }) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: key);
    } catch (e) {
      throw Exception(e);
    }
  }
}
