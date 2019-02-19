import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/blocs/captures_bloc.dart';
import 'package:seelang/models/capture.dart';
import 'package:seelang/pages/home_page.dart';
import 'package:seelang/pages/login_page.dart';
import 'package:seelang/services/auth/auth_service.dart';
import 'package:seelang/services/auth/firebase_auth_service.dart';
import 'package:seelang/services/camera/camera_service.dart';
import 'package:seelang/services/camera/basic_camera_service.dart';
import 'package:seelang/services/database/repository.dart';
import 'package:seelang/services/database/captures_repository.dart';
import 'package:seelang/services/storage/storage_service.dart';
import 'package:seelang/services/storage/firebase_storage_service.dart';
import 'package:seelang/services/vision/vision_service.dart';
import 'package:seelang/services/vision/firebase_vision_service.dart';
import 'package:seelang/utils/routes.dart';

void main() {
  var authService = new FirebaseAuthService();
  var cameraService = new BasicCameraService();
  var capturesRepository = new CapturesRepository('captures');
  var storageService = new FirebaseStorageService('captures');
  var visionService = new FirebaseVisionService();
  var capturesBloc = new CapturesBloc(cameraService, capturesRepository, storageService, visionService);
  runApp(new SeeLangApp(authService, capturesBloc));
}

class SeeLangApp extends StatelessWidget {
  final AuthService _authService;
  final CapturesBloc _capturesBloc;

  SeeLangApp(this._authService, this._capturesBloc);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SeeLang',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        buttonColor: Colors.blue,
      ),
      home: new LoginPage(_authService),
      routes: <String, WidgetBuilder> {
        Routes.Login: (BuildContext context) => new LoginPage(_authService),
        Routes.Home: (BuildContext context) => new HomePage(_capturesBloc),
      },
    );
  }
}
