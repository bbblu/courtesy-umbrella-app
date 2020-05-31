import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../common/button.dart';
import '../../model/borrow.dart';
import '../../resources/resources.dart';

class BorrowItem extends StatelessWidget {
  final Borrow data;

  BorrowItem({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: data.isReturn ? Colors.grey : null,
        borderRadius: BorderRadius.circular(5.0),
        gradient: data.isReturn ? null : MyColors.greenGradient,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.beach_access,
            size: 50.0,
            color: data.isReturn ? Colors.black : Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: data.isReturn
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                data.returnDate.toString().substring(0, 16),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: data.isReturn ? Colors.black : Colors.white,
                ),
              ),
              data.isReturn
                  ? Text(
                      data.borrowDate.toString().substring(0, 16),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: data.isReturn ? Colors.black : Colors.white,
                      ),
                    )
                  : MySmallFlatButton(
                      onPressed: () => {},
                      color: MyColors.primary4,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
