import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:seelang/services/storage/storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final String _storageRoot;

  FirebaseStorageService(this._storageRoot);

  Future<void> uploadFile(String fileName, File file) async {
    await _firebaseStorage.ref().child(_storageRoot).child(fileName).putFile(file).onComplete;
  }

  Future<String> getDownloadUrl(String fileName) async {
    return await _firebaseStorage.ref().child(_storageRoot).child(fileName).getDownloadURL();
  }
}