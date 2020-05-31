import 'package:equatable/equatable.dart';

abstract class QRCodeEvent extends Equatable {
  const QRCodeEvent();
}

class QRCodeButtonPressed extends QRCodeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'QrCodeButtonPressed {  }';
}

class CloseButtonPressed extends QRCodeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'CloseButtonPressed {  }';
}

class RetryButtonPressed extends QRCodeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'CloseButtonPressed {  }';
}
