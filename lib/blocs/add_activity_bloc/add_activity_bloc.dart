part of '../blocs.dart';

class AddActivityBloc extends Bloc<AddActivityEvent, AddActivityState> {
  AddActivityBloc() : super(_addActivityDataLoaded) {
    _textControllerFoodName.addListener(() {
      _currentEat.name = _textControllerFoodName.text.trim();
      add(SetAddActivityState());
    });

    _textControllerFoodCalory.addListener(() {
      _currentEat.calory = double.tryParse(_textControllerFoodCalory.text.trim()) ?? 0.0;
      add(SetAddActivityState());
    });

    _textControllerExerciseWeight.addListener(() {
      _currentExercise.weight = double.tryParse(_textControllerExerciseWeight.text.trim()) ?? 0.0;
      add(SetAddActivityState());
    });

    _textControllerExerciseTime.addListener(() {
      _currentExercise.time = double.tryParse(_textControllerExerciseTime.text.trim()) ?? 0.0;
      add(SetAddActivityState());
    });

    on<SetAddActivityState>((event, emit) => emit(event.state ?? _addActivityDataLoaded));

    on<SetAddActivityType>((event, emit) {
      _activityType = event.value;
      emit(_addActivityDataLoaded);
    });

    on<SetAddActivityExerciseType>((event, emit) {
      _currentExercise.exerciseType = event.value;
      emit(_addActivityDataLoaded);
    });

    on<AddActivityPressed>((event, emit) async {
      if (_activityType == ActivityType.eat && (_textControllerFoodName.text.trim().isEmpty || _textControllerFoodCalory.text.trim().isEmpty)) {
        NavigationHelper.clearSnackBars();
        NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Food name or calory is still empty')!)));
        return;
      } else if (_activityType == ActivityType.exercise && (_textControllerExerciseWeight.text.trim().isEmpty || _textControllerExerciseTime.text.trim().isEmpty)) {
        NavigationHelper.clearSnackBars();
        NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Weight or exercise time is still empty')!)));
        return;
      }

      try {
        int affectedRows = 0;

        switch (_activityType) {
          case ActivityType.eat:
            _currentEat.username = currentUser.username;
            _currentEat.date = DateTime.now();
            affectedRows = await DbHelper.instance.create(_currentEat, ignorePrimaryKey: true);
          case ActivityType.exercise:
            switch (_currentExercise.exerciseType) {
              case ExerciseType.generalSports:
                _currentExercise.caloriesBurned = countGeneralSports(weight: double.parse(_textControllerExerciseWeight.text.trim()), time: double.parse(_textControllerExerciseTime.text.trim()));
              case ExerciseType.individualExercise:
                _currentExercise.caloriesBurned = countIndividualExercise(weight: double.parse(_textControllerExerciseWeight.text.trim()), time: double.parse(_textControllerExerciseTime.text.trim()));
            }
            _currentExercise.username = currentUser.username;
            _currentExercise.date = DateTime.now();
            affectedRows = await DbHelper.instance.create(_currentExercise, ignorePrimaryKey: true);
        }

        if (affectedRows > 0) {
          NavigationHelper.clearSnackBars();
          NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Activity added successfully')!)));
        } else {
          showErrorDialog(Language.getInstance().getValue('Activity failed to add')!);
          return;
        }
      } catch (e) {
        showErrorDialog(Language.getInstance().getValue('Activity failed to add')!);
        return;
      }

      NavigationHelper.back();
      MyApp.homeBloc.add(InitializeHomeData());

      _textControllerFoodName.text = '';
      _textControllerFoodCalory.text = '';
      _textControllerExerciseWeight.text = '';
      _textControllerExerciseTime.text = '';
      _activityType = ActivityType.eat;
      _currentExercise.exerciseType = ExerciseType.generalSports;
      _currentExercise.caloriesBurned = 0;
      emit(_addActivityDataLoaded);
    });
  }

  static final TextEditingController _textControllerFoodName = TextEditingController();
  static final TextEditingController _textControllerFoodCalory = TextEditingController();
  static final TextEditingController _textControllerExerciseWeight = TextEditingController();
  static final TextEditingController _textControllerExerciseTime = TextEditingController();

  static ActivityType _activityType = ActivityType.eat;

  static final Eat _currentEat = Eat(id: 0, username: '', name: '', calory: 0, date: DateTime.now());

  static final Exercise _currentExercise = Exercise(id: 0, username: '', weight: 0, time: 0, exerciseType: ExerciseType.generalSports, caloriesBurned: 0, date: DateTime.now());

  static AddActivityDataLoaded get _addActivityDataLoaded => AddActivityDataLoaded(
        textControllerFoodName: _textControllerFoodName,
        textControllerFoodCalory: _textControllerFoodCalory,
        textControllerExerciseWeight: _textControllerExerciseWeight,
        textControllerExerciseTime: _textControllerExerciseTime,
        activityType: _activityType,
        currentEat: _currentEat,
        currentExercise: _currentExercise,
      );
}
