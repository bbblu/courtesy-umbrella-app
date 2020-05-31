import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
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
        Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
        ),
        SizedBox(
          height: 50.0,
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
