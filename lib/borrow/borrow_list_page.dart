import 'package:flutter/material.dart';

import '../model/borrow.dart';
import 'widget/widget.dart';

class BorrowListPage extends StatelessWidget {
  final List<Borrow> _datas = Borrow.fakeBorrowList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16.0),
      itemCount: _datas.length,
      itemBuilder: (BuildContext context, int index) {
        return BorrowItem(
          data: _datas[index],
        );
      },
    );
  }
}
