// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      primaryKey: json['primary_key'] as String? ?? 'username',
      username: json['username'] as String,
      password: json['password'] as String,
      dateOfBirth: _fromSecondSinceEpoch(json['date_of_birth'] as int),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'primary_key': instance.primaryKey,
      'username': instance.username,
      'password': instance.password,
      'date_of_birth': _toSecondSinceEpoch(instance.dateOfBirth),
      'gender': _$GenderEnumMap[instance.gender]!,
      'runtimeType': instance.$type,
    };

const _$GenderEnumMap = {
  Gender.man: 'man',
  Gender.woman: 'woman',
};

_$EatImpl _$$EatImplFromJson(Map<String, dynamic> json) => _$EatImpl(
      primaryKey: json['primary_key'] as String? ?? 'id',
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      calory: (json['calory'] as num).toDouble(),
      date: _fromSecondSinceEpoch(json['date'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EatImplToJson(_$EatImpl instance) => <String, dynamic>{
      'primary_key': instance.primaryKey,
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'calory': instance.calory,
      'date': _toSecondSinceEpoch(instance.date),
      'runtimeType': instance.$type,
    };

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      primaryKey: json['primary_key'] as String? ?? 'id',
      id: json['id'] as int,
      username: json['username'] as String,
      weight: (json['weight'] as num).toDouble(),
      time: (json['time'] as num).toDouble(),
      exerciseType: $enumDecode(_$ExerciseTypeEnumMap, json['exercise_type']),
      caloriesBurned: (json['calories_burned'] as num).toDouble(),
      date: _fromSecondSinceEpoch(json['date'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'primary_key': instance.primaryKey,
      'id': instance.id,
      'username': instance.username,
      'weight': instance.weight,
      'time': instance.time,
      'exercise_type': _$ExerciseTypeEnumMap[instance.exerciseType]!,
      'calories_burned': instance.caloriesBurned,
      'date': _toSecondSinceEpoch(instance.date),
      'runtimeType': instance.$type,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.generalSports: 'generalSports',
  ExerciseType.individualExercise: 'individualExercise',
};
