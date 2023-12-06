// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Model _$ModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'user':
      return User.fromJson(json);
    case 'eat':
      return Eat.fromJson(json);
    case 'exercise':
      return Exercise.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Model',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Model {
  @JsonKey(name: 'primary_key')
  String get primaryKey => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)
        user,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        eat,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        exercise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User value) user,
    required TResult Function(Eat value) eat,
    required TResult Function(Exercise value) exercise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User value)? user,
    TResult? Function(Eat value)? eat,
    TResult? Function(Exercise value)? exercise,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User value)? user,
    TResult Function(Eat value)? eat,
    TResult Function(Exercise value)? exercise,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelCopyWith<Model> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res, Model>;
  @useResult
  $Res call({@JsonKey(name: 'primary_key') String primaryKey, String username});
}

/// @nodoc
class _$ModelCopyWithImpl<$Res, $Val extends Model>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryKey = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'primary_key') String primaryKey,
      String username,
      String password,
      @JsonKey(
          name: 'date_of_birth',
          fromJson: _fromSecondSinceEpoch,
          toJson: _toSecondSinceEpoch)
      DateTime dateOfBirth,
      Gender gender});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryKey = null,
    Object? username = null,
    Object? password = null,
    Object? dateOfBirth = null,
    Object? gender = null,
  }) {
    return _then(_$UserImpl(
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends User {
  _$UserImpl(
      {@JsonKey(name: 'primary_key') this.primaryKey = 'username',
      required this.username,
      required this.password,
      @JsonKey(
          name: 'date_of_birth',
          fromJson: _fromSecondSinceEpoch,
          toJson: _toSecondSinceEpoch)
      required this.dateOfBirth,
      required this.gender,
      final String? $type})
      : $type = $type ?? 'user',
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'primary_key')
  final String primaryKey;
  @override
  String username;
  @override
  String password;
  @override
  @JsonKey(
      name: 'date_of_birth',
      fromJson: _fromSecondSinceEpoch,
      toJson: _toSecondSinceEpoch)
  DateTime dateOfBirth;
  @override
  Gender gender;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Model.user(primaryKey: $primaryKey, username: $username, password: $password, dateOfBirth: $dateOfBirth, gender: $gender)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)
        user,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        eat,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        exercise,
  }) {
    return user(primaryKey, username, password, dateOfBirth, gender);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
  }) {
    return user?.call(primaryKey, username, password, dateOfBirth, gender);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(primaryKey, username, password, dateOfBirth, gender);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User value) user,
    required TResult Function(Eat value) eat,
    required TResult Function(Exercise value) exercise,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User value)? user,
    TResult? Function(Eat value)? eat,
    TResult? Function(Exercise value)? exercise,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User value)? user,
    TResult Function(Eat value)? eat,
    TResult Function(Exercise value)? exercise,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class User extends Model {
  factory User(
      {@JsonKey(name: 'primary_key') final String primaryKey,
      required String username,
      required String password,
      @JsonKey(
          name: 'date_of_birth',
          fromJson: _fromSecondSinceEpoch,
          toJson: _toSecondSinceEpoch)
      required DateTime dateOfBirth,
      required Gender gender}) = _$UserImpl;
  User._() : super._();

  factory User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'primary_key')
  String get primaryKey;
  @override
  String get username;
  set username(String value);
  String get password;
  set password(String value);
  @JsonKey(
      name: 'date_of_birth',
      fromJson: _fromSecondSinceEpoch,
      toJson: _toSecondSinceEpoch)
  DateTime get dateOfBirth;
  @JsonKey(
      name: 'date_of_birth',
      fromJson: _fromSecondSinceEpoch,
      toJson: _toSecondSinceEpoch)
  set dateOfBirth(DateTime value);
  Gender get gender;
  set gender(Gender value);
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EatImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$EatImplCopyWith(_$EatImpl value, $Res Function(_$EatImpl) then) =
      __$$EatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'primary_key') String primaryKey,
      int id,
      String username,
      String name,
      double calory,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      DateTime date});
}

/// @nodoc
class __$$EatImplCopyWithImpl<$Res> extends _$ModelCopyWithImpl<$Res, _$EatImpl>
    implements _$$EatImplCopyWith<$Res> {
  __$$EatImplCopyWithImpl(_$EatImpl _value, $Res Function(_$EatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryKey = null,
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? calory = null,
    Object? date = null,
  }) {
    return _then(_$EatImpl(
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      calory: null == calory
          ? _value.calory
          : calory // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EatImpl extends Eat {
  _$EatImpl(
      {@JsonKey(name: 'primary_key') this.primaryKey = 'id',
      required this.id,
      required this.username,
      required this.name,
      required this.calory,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      required this.date,
      final String? $type})
      : $type = $type ?? 'eat',
        super._();

  factory _$EatImpl.fromJson(Map<String, dynamic> json) =>
      _$$EatImplFromJson(json);

  @override
  @JsonKey(name: 'primary_key')
  final String primaryKey;
  @override
  int id;
  @override
  String username;
  @override
  String name;
  @override
  double calory;
  @override
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Model.eat(primaryKey: $primaryKey, id: $id, username: $username, name: $name, calory: $calory, date: $date)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EatImplCopyWith<_$EatImpl> get copyWith =>
      __$$EatImplCopyWithImpl<_$EatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)
        user,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        eat,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        exercise,
  }) {
    return eat(primaryKey, id, username, name, calory, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
  }) {
    return eat?.call(primaryKey, id, username, name, calory, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
    required TResult orElse(),
  }) {
    if (eat != null) {
      return eat(primaryKey, id, username, name, calory, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User value) user,
    required TResult Function(Eat value) eat,
    required TResult Function(Exercise value) exercise,
  }) {
    return eat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User value)? user,
    TResult? Function(Eat value)? eat,
    TResult? Function(Exercise value)? exercise,
  }) {
    return eat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User value)? user,
    TResult Function(Eat value)? eat,
    TResult Function(Exercise value)? exercise,
    required TResult orElse(),
  }) {
    if (eat != null) {
      return eat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EatImplToJson(
      this,
    );
  }
}

abstract class Eat extends Model {
  factory Eat(
      {@JsonKey(name: 'primary_key') final String primaryKey,
      required int id,
      required String username,
      required String name,
      required double calory,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      required DateTime date}) = _$EatImpl;
  Eat._() : super._();

  factory Eat.fromJson(Map<String, dynamic> json) = _$EatImpl.fromJson;

  @override
  @JsonKey(name: 'primary_key')
  String get primaryKey;
  int get id;
  set id(int value);
  @override
  String get username;
  set username(String value);
  String get name;
  set name(String value);
  double get calory;
  set calory(double value);
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  DateTime get date;
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  set date(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$EatImplCopyWith<_$EatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'primary_key') String primaryKey,
      int id,
      String username,
      double weight,
      double time,
      @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
      @JsonKey(name: 'calories_burned') double caloriesBurned,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      DateTime date});
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryKey = null,
    Object? id = null,
    Object? username = null,
    Object? weight = null,
    Object? time = null,
    Object? exerciseType = null,
    Object? caloriesBurned = null,
    Object? date = null,
  }) {
    return _then(_$ExerciseImpl(
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      exerciseType: null == exerciseType
          ? _value.exerciseType
          : exerciseType // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl extends Exercise {
  _$ExerciseImpl(
      {@JsonKey(name: 'primary_key') this.primaryKey = 'id',
      required this.id,
      required this.username,
      required this.weight,
      required this.time,
      @JsonKey(name: 'exercise_type') required this.exerciseType,
      @JsonKey(name: 'calories_burned') required this.caloriesBurned,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      required this.date,
      final String? $type})
      : $type = $type ?? 'exercise',
        super._();

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  @JsonKey(name: 'primary_key')
  final String primaryKey;
  @override
  int id;
  @override
  String username;
  @override
  double weight;
  @override
  double time;
  @override
  @JsonKey(name: 'exercise_type')
  ExerciseType exerciseType;
  @override
  @JsonKey(name: 'calories_burned')
  double caloriesBurned;
  @override
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Model.exercise(primaryKey: $primaryKey, id: $id, username: $username, weight: $weight, time: $time, exerciseType: $exerciseType, caloriesBurned: $caloriesBurned, date: $date)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)
        user,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        eat,
    required TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)
        exercise,
  }) {
    return exercise(primaryKey, id, username, weight, time, exerciseType,
        caloriesBurned, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult? Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
  }) {
    return exercise?.call(primaryKey, id, username, weight, time, exerciseType,
        caloriesBurned, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            String username,
            String password,
            @JsonKey(
                name: 'date_of_birth',
                fromJson: _fromSecondSinceEpoch,
                toJson: _toSecondSinceEpoch)
            DateTime dateOfBirth,
            Gender gender)?
        user,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            String name,
            double calory,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        eat,
    TResult Function(
            @JsonKey(name: 'primary_key') String primaryKey,
            int id,
            String username,
            double weight,
            double time,
            @JsonKey(name: 'exercise_type') ExerciseType exerciseType,
            @JsonKey(name: 'calories_burned') double caloriesBurned,
            @JsonKey(
                fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
            DateTime date)?
        exercise,
    required TResult orElse(),
  }) {
    if (exercise != null) {
      return exercise(primaryKey, id, username, weight, time, exerciseType,
          caloriesBurned, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(User value) user,
    required TResult Function(Eat value) eat,
    required TResult Function(Exercise value) exercise,
  }) {
    return exercise(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(User value)? user,
    TResult? Function(Eat value)? eat,
    TResult? Function(Exercise value)? exercise,
  }) {
    return exercise?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(User value)? user,
    TResult Function(Eat value)? eat,
    TResult Function(Exercise value)? exercise,
    required TResult orElse(),
  }) {
    if (exercise != null) {
      return exercise(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class Exercise extends Model {
  factory Exercise(
      {@JsonKey(name: 'primary_key') final String primaryKey,
      required int id,
      required String username,
      required double weight,
      required double time,
      @JsonKey(name: 'exercise_type') required ExerciseType exerciseType,
      @JsonKey(name: 'calories_burned') required double caloriesBurned,
      @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
      required DateTime date}) = _$ExerciseImpl;
  Exercise._() : super._();

  factory Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  @JsonKey(name: 'primary_key')
  String get primaryKey;
  int get id;
  set id(int value);
  @override
  String get username;
  set username(String value);
  double get weight;
  set weight(double value);
  double get time;
  set time(double value);
  @JsonKey(name: 'exercise_type')
  ExerciseType get exerciseType;
  @JsonKey(name: 'exercise_type')
  set exerciseType(ExerciseType value);
  @JsonKey(name: 'calories_burned')
  double get caloriesBurned;
  @JsonKey(name: 'calories_burned')
  set caloriesBurned(double value);
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  DateTime get date;
  @JsonKey(fromJson: _fromSecondSinceEpoch, toJson: _toSecondSinceEpoch)
  set date(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
