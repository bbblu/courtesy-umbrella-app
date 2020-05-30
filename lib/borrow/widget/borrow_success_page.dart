import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../borrow/bloc/bloc.dart';
import '../../borrow/bloc/borrow_event.dart';
import '../../common/button.dart';
import '../../resources/resources.dart';

class BorrowSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          SizedBox(height: 40.0),
          Text(
            '成功',
            style: TextStyle(
              fontSize: 50.0,
              color: MyColors.primary1,
            ),
          ),
          SizedBox(height: 40.0),
          Image.asset(
            'assets/images/borrow_success.png',
            height: 235.0,
          ),
          SizedBox(height: 40.0),
          MyFlatButton(
            onPressed: () =>
                BlocProvider.of<BorrowBloc>(context).add(CloseButtonPressed()),
            stream: Stream.value(true),
            text: '關閉',
          ),
        ],
      ),
    );
  }
}
