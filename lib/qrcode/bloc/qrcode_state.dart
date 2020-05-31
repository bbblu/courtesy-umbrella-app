import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QRCodeState extends Equatable {
  const QRCodeState();

  @override
  List<Object> get props => [];
}

class QRCodeInitial extends QRCodeState {}

class QRCodeLoading extends QRCodeState {}

class QRCodeSuccess extends QRCodeState {}

class QRCodeFailure extends QRCodeState {
  final String error;

  const QRCodeFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'QRCodeFailure { error: $error }';
}
