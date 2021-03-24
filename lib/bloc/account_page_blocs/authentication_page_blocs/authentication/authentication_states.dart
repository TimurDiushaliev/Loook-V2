abstract class AuthenticationStates {}

class SignedInState extends AuthenticationStates {}

class SignedUpState extends AuthenticationStates {}

class AuthenticationErrorState extends AuthenticationStates {}

class NotAuthenticatedState extends AuthenticationStates {}
