import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../borrow/bloc/bloc.dart';
import 'widget/widget.dart';

class BorrowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BorrowBloc();
      },
      child: Center(
        child: BlocBuilder<BorrowBloc, BorrowState>(
          builder: (context, state) {
            if (state is BorrowSuccess) {
              return BorrowSuccessPage();
            } else if (state is BorrowFailure) {
              return BorrowFailurePage();
            } else {
              return QRCodeScannerPage();
            }
          },
        ),
      ),
    );
  }
}
