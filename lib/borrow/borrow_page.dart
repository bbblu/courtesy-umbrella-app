import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class BorrowPage extends StatelessWidget {
  Future<void> getPermission() async {
    if (await Permission.camera.request().isGranted) {
      scan();
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
      ].request();
      print(statuses[Permission.camera]);
    }
  }

  Future<String> scan() async {
    String qrCodeUrl = await FlutterBarcodeScanner.scanBarcode(
      '#FFFFFF',
      '取消',
      false,
      ScanMode.QR,
    );

    print(qrCodeUrl);
    return qrCodeUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          getPermission();
        },
        child: Center(
          child: Column(
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
              Text('請掃描傘架上的 QRCode'),
            ],
          ),
        ),
      ),
    );
  }
}
