import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/repository/authentication_repository.dart';
import 'package:loook/services/authentification_provider.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc(AuthenticationStates initialState) : super(initialState);
  String signInState;
  String signUpState;

  @override
  Stream<AuthenticationStates> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is SignInEvent) {
      yield  SignInProcessingState();
      try {
        signInState = await AuthenticationProvider.signIn(
            username: event.username, password: event.password);
        print('$signInState');
        await AuthenticationRepository.accesToken;
        await AuthenticationRepository.refreshToken;
        yield SignInUserState(userState: signInState);
      } catch (_) {
        yield AuthenticationErrorState();
      }
    }
    if (event is SignUpEvent) {
      yield SignUpProcessingState();
      try {
        signUpState = await AuthenticationProvider.signUp(
            username: event.username,
            password: event.password,
            phoneNumber: event.phoneNumber);
        print('$signUpState');
        yield SignUpUserState(userState: signUpState);
      } catch (_) {
        yield AuthenticationErrorState();
      }
    }
    if (event is SignOutEvent) yield NotAuthenticatedState();
  }
}
