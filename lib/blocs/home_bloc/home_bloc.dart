part of '../blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SetHomeState>((event, emit) => emit(event.state ?? _homeDataLoaded));

    on<SetHomeToInitial>((event, emit) => emit(HomeInitial()));

    on<InitializeHomeData>((event, emit) async {
      DateTime now = DateTime.now();

      _eats = await DbHelper.instance.read<Eat>(
        where: 'date >= ? AND date <= ? AND username = ?',
        whereArgs: [
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch ~/ 1000,
          DateTime(now.year, now.month, now.day, 23, 59, 59).millisecondsSinceEpoch ~/ 1000,
          currentUser.username,
        ],
      );

      _exercises = await DbHelper.instance.read<Exercise>(
        where: 'date >= ? AND date <= ? AND username = ?',
        whereArgs: [
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch ~/ 1000,
          DateTime(now.year, now.month, now.day, 23, 59, 59).millisecondsSinceEpoch ~/ 1000,
          currentUser.username,
        ],
      );
      emit(_homeDataLoaded);
    });
  }

  List<Eat> _eats = [];
  List<Exercise> _exercises = [];

  HomeDataLoaded get _homeDataLoaded => HomeDataLoaded(
        eats: _eats,
        exercises: _exercises,
      );
}
