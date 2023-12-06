part of '../blocs.dart';

@immutable
abstract class HomeEvent {}

class SetHomeState extends HomeEvent {
  SetHomeState([this.state]);

  final HomeState? state;
}

class SetHomeToInitial extends HomeEvent {}

class InitializeHomeData extends HomeEvent {}
