part of 'enums.dart';

enum Gender {
  man,
  woman;

  String get text => switch (this) {
        man => 'Man',
        woman => 'Woman',
      };
}
