import 'package:calory_tracker/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m_widget/m_widget.dart';

part 'model.freezed.dart';
part 'model.g.dart';

DateTime _fromSecondSinceEpoch(int seconds) => DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

int _toSecondSinceEpoch(DateTime dateTime) => dateTime.millisecondsSinceEpoch ~/ 1000;

@unfreezed
sealed class Model with _$Model {
  const Model._();

  factory Model.user({
    @JsonKey(name: 'primary_key') @Default('username') final String primaryKey,
    required String username,
    required String password,
    @JsonKey(name: 'date_of_birth', fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch) required DateTime dateOfBirth,
    required Gender gender,
  }) = User;

  factory Model.eat({
    @JsonKey(name: 'primary_key') @Default('id') final String primaryKey,
    required int id,
    required String username,
    required String name,
    required double calory,
    @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch) required DateTime date,
  }) = Eat;

  factory Model.exercise({
    @JsonKey(name: 'primary_key') @Default('id') final String primaryKey,
    required int id,
    required String username,
    required double weight,
    required double time,
    @JsonKey(name: 'exercise_type') required ExerciseType exerciseType,
    @JsonKey(name: 'calories_burned') required double caloriesBurned,
    @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch) required DateTime date,
  }) = Exercise;

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJsonDB() {
    Map<String, dynamic> map = toJson().map((key, value) => MapEntry(key.toSnakeCase(), value));
    String? runtimeType = map['runtime_type'];
    if (runtimeType != null && runtimeType.substring(runtimeType.length - 1) != 's') {
      map['runtime_type'] = '${map['runtime_type']}s';
    }

    return map;
  }
}
