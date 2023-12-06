part of 'enums.dart';

enum ExerciseType {
  generalSports,
  individualExercise;

  String get text => switch (this) {
        generalSports => 'General sports',
        individualExercise => 'Individual exercise',
      };

  String get subtitle => switch (this) {
        generalSports => '(Badminton, Football, Basketball, Yoga, Cycling, Gymnastics, Pilates, Tai chi)',
        individualExercise => '(Walking, Jumping Jacks, Push Ups, Leg Lifts, Sit Ups, Jogging, Squats, Lifting Weights)',
      };
}
