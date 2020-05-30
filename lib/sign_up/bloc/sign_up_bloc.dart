import 'package:bloc/bloc.dart';

import '../../api/api_client.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc();

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final response = await ApiClient.instance.post('/user/register', body: {
          'account': event.username,
          'password': event.password,
          'email': event.email,
          'birthday': event.birthday,
        });

        if (response.result) {
          yield SignUpInitial();
        } else {
          yield SignUpFailure(error: response.message);
        }
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
