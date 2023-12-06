part of '../blocs.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryError extends HistoryState {}

class HistoryDataLoaded extends HistoryState {
  HistoryDataLoaded({
    required this.date,
    required this.currentTabIndex,
    required this.eats,
    required this.exercises,
    required this.isLoading,
  });

  final DateTimeRange date;

  final int currentTabIndex;

  final List<Eat> eats;
  final List<Exercise> exercises;

  final bool isLoading;
}
