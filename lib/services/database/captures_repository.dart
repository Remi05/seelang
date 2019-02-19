import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:seelang/models/capture.dart';
import 'package:seelang/services/database/repository.dart';

class CapturesRepository implements Repository<Capture> {
    final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final String _collectionRoot;

  CapturesRepository(this._collectionRoot);

  Future<Capture> once(String id) async {
    var snapshot = await _firebaseDatabase.reference()
                                          .child(_collectionRoot)
                                          .child(id)
                                          .once();
    return Capture.fromJson(snapshot.value);
  }

  Future<List<Capture>> all() async {
    var snapshot = await _firebaseDatabase.reference()
                                          .child(_collectionRoot)
                                          .once();
    var t = Map<String, dynamic>.from(snapshot.value); 
    var capturesDicts = t.values.toList();
    return capturesDicts.map((captureDict) => Capture.fromJson(Map<String, dynamic>.from(captureDict))).toList();
  }

  Future<void> add(Capture value) async {
    var captureDict = jsonDecode(jsonEncode(value.toJson()));
    return _firebaseDatabase.reference()
                            .child(_collectionRoot)
                            .push()
                            .set(captureDict);
  }

  Future<void> update(String id, Capture value) async {
    var captureDict = jsonDecode(jsonEncode(value.toJson()));
    return _firebaseDatabase.reference()
                            .child(_collectionRoot)
                            .child(id)
                            .set(captureDict);
  }

  Future<void> delete(String id) async {
    return _firebaseDatabase.reference()
                            .child(_collectionRoot)
                            .child(id)
                            .remove();
  }
}