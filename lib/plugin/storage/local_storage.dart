import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalStorage {
  Future<void> writeItem(String key, String data) async {
    try {
      await const FlutterSecureStorage().write(key: key, value: data);
    } catch (e) {
      debugPrint('LocalStorageService.writeItem Exception: ${e.toString()}');
    }
  }

  Future<String?> readItem(String key) async {
    try {
      String? value = await const FlutterSecureStorage().read(key: key);
      return value;
    } catch (e) {
      debugPrint('LocalStorageService.readItem Exception: ${e.toString()}');
    }
    return null;
  }

  Future<void> deleteItem({required String key}) async {
    try {
      await const FlutterSecureStorage().delete(key: key);
    } catch (ex) {
      debugPrint('LocalStorageService.deleteItem Exception: ${ex.toString()}');
    }
  }

  Future<void> clearAllItem() async {
    try {
      await const FlutterSecureStorage().deleteAll();
    } catch (e) {
      debugPrint('LocalStorageService.clearAllItem Exception: ${e.toString()}');
    }
  }
}
