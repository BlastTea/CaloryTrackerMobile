part of '../blocs.dart';

@immutable
abstract class HistoryEvent {}

class SetHistoryState extends HistoryEvent {
  SetHistoryState([this.state]);

  final HistoryState? state;
}

class SetHistoryToInitial extends HistoryEvent {}

class InitializeHistoryData extends HistoryEvent {
  InitializeHistoryData({this.completer});

  final Completer<bool>? completer;
}

class SetHistoryDate extends HistoryEvent {
  SetHistoryDate({required this.value});

  final DateTimeRange value;
}

class SetHistoryTabIndex extends HistoryEvent {
  SetHistoryTabIndex({required this.value});

  final int value;
}
