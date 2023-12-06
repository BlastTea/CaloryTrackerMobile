part of '../blocs.dart';

@immutable
abstract class AddActivityEvent {}

class SetAddActivityState extends AddActivityEvent {
  SetAddActivityState([this.state]);

  final AddActivityState? state;
}

class SetAddActivityType extends AddActivityEvent {
  SetAddActivityType({required this.value});

  final ActivityType value;
}

class SetAddActivityExerciseType extends AddActivityEvent {
  SetAddActivityExerciseType({required this.value});

  final ExerciseType value;
}

class AddActivityPressed extends AddActivityEvent {}
