import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_events.dart';
import 'package:loook/bloc/account_page_blocs/authentication_page_blocs/authentication/authentication_states.dart';
import 'package:loook/repository/authentication_repository.dart';
import 'package:loook/services/authentification_provider.dart';

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
      print('${AuthenticationRepository.accesToken};');
      yield SignedInState();
    }
    if (event is SignUpEvent) {
      AuthenticationProvider.signUp(username: event.username, password: event.password, phoneNumber: event.phoneNumber);
      yield SignedUpState();
    }
    if(event is SignOutEvent) yield NotAuthenticatedState();
  }
}
