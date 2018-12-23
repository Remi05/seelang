import 'dart:io';

abstract class StorageService {
  Future<void> uploadFile(String fileName, File file);
  Future<String> getDownloadUrl(String fileName);
}