import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../qrcode/bloc/bloc.dart';
import 'widget/widget.dart';

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return QRCodeBloc();
      },
      child: Center(
        child: BlocBuilder<QRCodeBloc, QRCodeState>(
          builder: (context, state) {
            if (state is QRCodeSuccess) {
              return QRCodeSuccessPage();
            } else if (state is QRCodeFailure) {
              return QRCodeFailurePage();
            } else {
              return QRCodeScannerPage();
            }
          },
        ),
      ),
    );
  }
}
