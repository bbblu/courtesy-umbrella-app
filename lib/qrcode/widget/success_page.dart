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
          Spacer(),
          Text(
            '成功',
            style: TextStyle(
              fontSize: 50.0,
              color: MyColors.primary1,
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/borrow_success.png',
            height: 235.0,
          ),
          Spacer(flex: 2),
          MyFlatButton(
            onPressed: () =>
                BlocProvider.of<QRCodeBloc>(context).add(CloseButtonPressed()),
            stream: Stream.value(true),
            text: '關閉',
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
