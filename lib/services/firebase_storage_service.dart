import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:seelang/services/storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadFile(String fileName, File file) async {
    await _firebaseStorage.ref().child(fileName).putFile(file).onComplete;
  }

  Future<String> getDownloadUrl(String fileName) async {
    return await _firebaseStorage.ref().child(fileName).getDownloadURL();
  }
}