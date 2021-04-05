import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/repository/authentication_repository.dart';
import 'package:loook/services/authentification_provider.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/bloc/authentication_page_blocs/authentication/authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc(AuthenticationStates initialState) : super(initialState);

  @override
  Stream<AuthenticationStates> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is SignInEvent) {
      await AuthenticationProvider.signIn(
          username: event.username, password: event.password);
      await AuthenticationRepository.accesToken;
      await AuthenticationRepository.refreshToken;
      yield SignedInState();
    }
    if (event is SignUpEvent) {
      await AuthenticationProvider.signUp(
          username: event.username,
          password: event.password,
          phoneNumber: event.phoneNumber);
      
      yield SignedUpState();
    }
    if (event is SignOutEvent) yield NotAuthenticatedState();
  }
}
