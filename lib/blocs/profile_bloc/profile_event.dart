part of '../blocs.dart';

@immutable
abstract class ProfileEvent {}

class SetProfileState extends ProfileEvent {
  SetProfileState([this.state]);

  final ProfileState? state;
}

class InitializeProfileData extends ProfileEvent {}

class SetProfileUser extends ProfileEvent {
  SetProfileUser({required this.value});

  final User value;
}

class SetProfileIsPasswordVisible extends ProfileEvent {
  SetProfileIsPasswordVisible({required this.value});

  final bool value;
}

class ProfileSavePressed extends ProfileEvent {}
