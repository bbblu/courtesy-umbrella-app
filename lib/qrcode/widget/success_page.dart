import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../qrcode/bloc/bloc.dart';
import '../../qrcode/bloc/qrcode_event.dart';
import '../../resources/resources.dart';

class QRCodeSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          SizedBox(height: 40.0),
          Text(
            '成功',
            style: TextStyle(
              fontSize: 50.0,
              color: MyColors.primary1,
            ),
          ),
          SizedBox(height: 40.0),
          Image.asset(
            'assets/images/qrcode_success.png',
            height: 235.0,
          ),
          SizedBox(height: 40.0),
          MyFlatButton(
            onPressed: () =>
                BlocProvider.of<QRCodeBloc>(context).add(CloseButtonPressed()),
            stream: Stream.value(true),
            text: '關閉',
          ),
        ],
      ),
    );
  }
}
