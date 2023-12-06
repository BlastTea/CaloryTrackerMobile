part of '../blocs.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoaded extends HomeState {
  HomeDataLoaded({
    required this.eats,
    required this.exercises,
  });

  final List<Eat> eats;
  final List<Exercise> exercises;
}
