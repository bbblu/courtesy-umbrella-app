import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'borrow_event.dart';
import 'borrow_state.dart';

class BorrowBloc extends Bloc<BorrowEvent, BorrowState> {
  @override
  BorrowState get initialState => BorrowInitial();

  @override
  Stream<BorrowState> mapEventToState(BorrowEvent event) async* {
    if (event is QRCodeButtonPressed || event is RetryButtonPressed) {
      yield BorrowLoading();

      try {
        String qrCodeUrl = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF',
          '取消',
          false,
          ScanMode.QR,
        );
        print('QRCode: $qrCodeUrl');

        if (qrCodeUrl != '-1') {
          yield BorrowSuccess();
        } else {
          yield BorrowFailure(error: '上次雨傘尚未歸還');
        }
      } catch (error) {
        yield BorrowFailure(error: error.toString());
      }
    }

    if (event is CloseButtonPressed) {
      yield BorrowInitial();
    }
  }
}
