import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/button.dart';
import '../bloc/bloc.dart';

class QRCodeScannerPage extends StatelessWidget {
  Future<void> getPermission(BuildContext context) async {
    if (await Permission.camera.request().isGranted) {
      await scan(context);
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
      ].request();
      print(statuses[Permission.camera]);
    }
  }

  Future<void> scan(BuildContext context) async {
    BlocProvider.of<BorrowBloc>(context).add(QRCodeButtonPressed());
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
          onPressed: () => getPermission(context),
          text: '請掃描傘架上的 QRCode',
          color: Colors.black,
        ),
      ],
    );
  }
}
