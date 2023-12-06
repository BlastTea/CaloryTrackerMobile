part of '../blocs.dart';

@immutable
abstract class AuthenticationEvent {}

class SetAuthenticationState extends AuthenticationEvent {
  SetAuthenticationState([this.state]);

  final AuthenticationState? state;
}

class SetIsSignInPasswordVisible extends AuthenticationEvent {
  SetIsSignInPasswordVisible({required this.value});

  final bool value;
}

class SetIsSignUpPasswordVisible extends AuthenticationEvent {
  SetIsSignUpPasswordVisible({required this.value});

  final bool value;
}

class SetUserSignUp extends AuthenticationEvent {
  SetUserSignUp({required this.value});

  final User value;
}

class SignInPressed extends AuthenticationEvent {}

class SignUpPressed extends AuthenticationEvent {}
