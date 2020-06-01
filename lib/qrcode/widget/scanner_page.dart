import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../resources/resources.dart';
import '../bloc/bloc.dart';

class QRCodeScannerPage extends StatelessWidget {
  Future<void> scan(BuildContext context) async {
    BlocProvider.of<QRCodeBloc>(context).add(QRCodeButtonPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
          ),
        ),
        SizedBox(
          height: screenWidth / 25,
        ),
        MyTextButton(
          onPressed: () => scan(context),
          text: '請掃描傘架上的 QRCode',
          color: Colors.black,
        ),
      ],
    );
  }
}
