import 'package:bloc/bloc.dart';

import '../../api/api_client.dart';
import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc();

  @override
  ForgetPasswordState get initialState => ForgetPasswordInitial();

  @override
  Stream<ForgetPasswordState> mapEventToState(
      ForgetPasswordEvent event) async* {
    if (event is ForgetPasswordButtonPressed) {
      yield ForgetPasswordLoading();

      try {
        final response =
            await ApiClient.instance.post('/user/forget_password', body: {
          'email': event.email,
        });

        if (response.result) {
          yield ForgetPasswordInitial();
        } else {
          yield ForgetPasswordFailure(error: response.message);
        }
      } catch (error) {
        yield ForgetPasswordFailure(error: error.toString());
      }
    }
  }
}
