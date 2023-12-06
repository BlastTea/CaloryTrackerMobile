part of 'enums.dart';

enum ActivityType {
  eat,
  exercise;

  String get text => switch (this) {
        eat => 'Eat',
        exercise => 'Exercise',
      };

  IconData get icon => switch (this) {
        eat => Icons.dinner_dining,
        exercise => Icons.sports_gymnastics,
      };
}
