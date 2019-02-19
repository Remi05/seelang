import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/blocs/captures_bloc.dart';
import 'package:seelang/components/background_icon.dart';
import 'package:seelang/models/capture.dart';

class CapturesPage extends StatelessWidget {
  final CapturesBloc _capturesBloc;

  CapturesPage(this._capturesBloc);

  Widget _buildNoCapturesWidget() {
    return Center(
      child: BackgroundIcon(
          icon: Icons.add_photo_alternate,
          text: 'No captures'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _capturesBloc.capturesStream,
      builder: (BuildContext context, AsyncSnapshot<List<Capture>> snapshot) {
        if (!snapshot.hasData || snapshot.data.length == 0) 
          return _buildNoCapturesWidget();

        List<Capture> captures = snapshot.data;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  3),
          itemCount: captures.length,
          itemBuilder: (context, index) {
            return Image.network(captures[index].imageUrl);
          }
        );
      },
    );
  }
}