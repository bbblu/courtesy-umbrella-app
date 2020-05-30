import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BorrowState extends Equatable {
  const BorrowState();

  @override
  List<Object> get props => [];
}

class BorrowInitial extends BorrowState {}

class BorrowLoading extends BorrowState {}

class BorrowSuccess extends BorrowState {}

class BorrowFailure extends BorrowState {
  final String error;

  const BorrowFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BorrowFailure { error: $error }';
}
