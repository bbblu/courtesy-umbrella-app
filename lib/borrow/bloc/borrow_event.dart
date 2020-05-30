import 'package:equatable/equatable.dart';

abstract class BorrowEvent extends Equatable {
  const BorrowEvent();
}

class QRCodeButtonPressed extends BorrowEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'QrCodeButtonPressed {  }';
}

class CloseButtonPressed extends BorrowEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'CloseButtonPressed {  }';
}

class RetryButtonPressed extends BorrowEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'CloseButtonPressed {  }';
}
