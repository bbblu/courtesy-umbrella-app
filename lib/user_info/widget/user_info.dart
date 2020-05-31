import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/bloc.dart';
import '../../common/button.dart';
import '../../resources/resources.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                  ),
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: MyColors.primary1,
                  ),
                ),
                SizedBox(
                  height: 70.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'john0224',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MySmallFlatButton(
                            onPressed: () => BlocProvider.of<AuthBloc>(context)
                                .add(LoggedOut()),
                            text: '登出',
                            color: MyColors.primary2,
                          )
                        ],
                      ),
                      Text(
                        'john0224@gmail.com',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 32.0,
              thickness: 1.0,
              color: Colors.white,
            ),
            Container(
              child: Text(
                '違規次數: 1 / 5',
                style: TextStyle(fontSize: 20.0),
              ),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColors.primary4,
                borderRadius: BorderRadius.circular(5.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
