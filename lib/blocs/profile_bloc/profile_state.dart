part of '../blocs.dart';

@immutable
abstract class ProfileState {}

class ProfileDataLoaded extends ProfileState {
  ProfileDataLoaded({
    required this.textControllerUsername,
    required this.textControllerPassword,
    required this.currentUser,
    required this.isPasswordVisible,
    required this.isDiff,
  });

  final TextEditingController textControllerUsername;
  final TextEditingController textControllerPassword;

  final User currentUser;

  final bool isPasswordVisible;
  final bool isDiff;
}
