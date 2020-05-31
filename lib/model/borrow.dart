import 'package:meta/meta.dart';

class Borrow {
  DateTime borrowDate;
  DateTime returnDate;
  bool isReturn;

  Borrow({
    @required this.borrowDate,
    @required this.returnDate,
    @required this.isReturn,
  });

  static final List<Borrow> fakeBorrowList = [
    Borrow(
      borrowDate: DateTime(2020, 5, 21, 14, 30),
      returnDate: DateTime(2020, 5, 21, 14, 30),
      isReturn: false,
    ),
    Borrow(
      borrowDate: DateTime(2020, 5, 20, 12, 0),
      returnDate: DateTime(2020, 5, 20, 13, 0),
      isReturn: true,
    ),
    Borrow(
      borrowDate: DateTime(2020, 5, 19, 17, 0),
      returnDate: DateTime(2020, 5, 19, 18, 0),
      isReturn: true,
    ),
    Borrow(
      borrowDate: DateTime(2020, 5, 16, 16, 0),
      returnDate: DateTime(2020, 5, 16, 16, 30),
      isReturn: true,
    ),
    Borrow(
      borrowDate: DateTime(2020, 5, 1, 17, 0),
      returnDate: DateTime(2020, 5, 1, 17, 30),
      isReturn: true,
    ),
  ];
}
