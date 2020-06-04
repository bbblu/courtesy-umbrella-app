import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'qrcode_event.dart';
import 'qrcode_state.dart';

class QRCodeBloc extends Bloc<QRCodeEvent, QRCodeState> {
  @override
  QRCodeState get initialState => QRCodeInitial();

  @override
  Stream<QRCodeState> mapEventToState(QRCodeEvent event) async* {
    if (event is QRCodeButtonPressed || event is RetryButtonPressed) {
      yield QRCodeLoading();

      try {
        String qrCodeUrl = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF',
          '取消',
          false,
          ScanMode.QR,
        );
        print('QRCode: $qrCodeUrl');

        if (qrCodeUrl != '-1') {
          yield QRCodeSuccess();
        } else {
          yield QRCodeFailure(error: '掃描失敗');
        }
      } catch (error) {
        yield QRCodeFailure(error: error.toString());
      }
    }

    if (event is CloseButtonPressed) {
      yield QRCodeInitial();
    }
  }
}
