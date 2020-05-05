import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/api_client.dart';
import '../../auth/bloc/bloc.dart';
import '../../auth/user_repository.dart';
import '../../model/token.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authBloc,
  })  : assert(userRepository != null),
        assert(authBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final response = await ApiClient.instance.post<Token>('/login', body: {
          'account': event.username,
          'password': event.password,
        });

        if (response.result) {
          ApiClient.instance.token = (response.data as Token).token;
        }

        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
