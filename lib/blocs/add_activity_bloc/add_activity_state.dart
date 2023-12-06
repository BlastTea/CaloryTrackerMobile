part of '../blocs.dart';

@immutable
abstract class AddActivityState {}

class AddActivityDataLoaded extends AddActivityState {
  AddActivityDataLoaded({
    required this.textControllerFoodName,
    required this.textControllerFoodCalory,
    required this.textControllerExerciseWeight,
    required this.textControllerExerciseTime,
    required this.activityType,
    required this.currentEat,
    required this.currentExercise,
  });

  final TextEditingController textControllerFoodName;
  final TextEditingController textControllerFoodCalory;
  final TextEditingController textControllerExerciseWeight;
  final TextEditingController textControllerExerciseTime;

  final ActivityType activityType;

  final Eat currentEat;

  final Exercise currentExercise;
}
