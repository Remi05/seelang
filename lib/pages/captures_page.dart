import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/components/background_icon.dart';

class CapturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new BackgroundIcon(
          icon: Icons.add_photo_alternate,
          text: 'No captures'
      ),
    );
  }
}