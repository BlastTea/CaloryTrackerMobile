part of '../blocs.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationDataLoaded extends AuthenticationState {
  AuthenticationDataLoaded({
    required this.textControllerUsernameSignIn,
    required this.textControllerPasswordSignIn,
    required this.textControllerUsernameSignUp,
    required this.textControllerPasswordSignUp,
    required this.userSignup,
    required this.isSignInPasswordVisible,
    required this.isSignUpPasswordVisible,
    required this.isSigningIn,
    required this.isSigningUp,
  });

  final TextEditingController textControllerUsernameSignIn;
  final TextEditingController textControllerPasswordSignIn;
  final TextEditingController textControllerUsernameSignUp;
  final TextEditingController textControllerPasswordSignUp;

  final User userSignup;

  final bool isSignInPasswordVisible;
  final bool isSignUpPasswordVisible;
  final bool isSigningIn;
  final bool isSigningUp;
}
