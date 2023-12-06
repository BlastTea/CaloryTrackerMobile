part of '../blocs.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<SetHistoryState>((event, emit) => emit(event.state ?? _historyDataLoaded));

    on<SetHistoryToInitial>((event, emit) {
      DateTime now = DateTime.now();

      _date = DateTimeRange(start: DateTime(now.year, now.month, now.day), end: DateTime(now.year, now.month, now.day, 23, 59, 59));

      _currentTabIndex = 0;

      _eats.clear();
      _exercises.clear();

      _isLoading = false;

      emit(HistoryInitial());
    });

    on<InitializeHistoryData>((event, emit) async {
      if (event.completer == null) {
        _isLoading = true;
        emit(_historyDataLoaded);
      }

      await _initializeHistory();

      if (event.completer != null) {
        event.completer!.complete(true);
      }

      if (event.completer == null) {
        _isLoading = false;
      }
      emit(_historyDataLoaded);
    });

    on<SetHistoryDate>((event, emit) async {
      _isLoading = true;
      _date = event.value;
      emit(_historyDataLoaded);

      await _initializeHistory();

      _isLoading = false;
      emit(_historyDataLoaded);
    });

    on<SetHistoryTabIndex>((event, emit) {
      _currentTabIndex = event.value;
      emit(_historyDataLoaded);
    });
  }

  DateTimeRange _date = DateTimeRange(start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day), end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59));

  int _currentTabIndex = 0;

  List<Eat> _eats = [];
  List<Exercise> _exercises = [];

  bool _isLoading = false;

  HistoryDataLoaded get _historyDataLoaded => HistoryDataLoaded(
        date: _date,
        currentTabIndex: _currentTabIndex,
        eats: _eats,
        exercises: _exercises,
        isLoading: _isLoading,
      );

  Future<void> _initializeHistory() async {
    try {
      _eats.clear();
      _exercises.clear();

      _eats = await DbHelper.instance.read<Eat>(
        where: 'date >= ? AND date <= ? AND username = ?',
        whereArgs: [
          _date.start.millisecondsSinceEpoch ~/ 1000,
          _date.end.millisecondsSinceEpoch ~/ 1000,
          currentUser.username,
        ],
      );

      _exercises = await DbHelper.instance.read<Exercise>(
        where: 'date >= ? AND date <= ? AND username = ?',
        whereArgs: [
          _date.start.millisecondsSinceEpoch ~/ 1000,
          _date.end.millisecondsSinceEpoch ~/ 1000,
          currentUser.username,
        ],
      );
    } catch (e) {
      add(SetHistoryState(HistoryError()));
    }
  }
}
