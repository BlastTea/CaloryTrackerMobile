part of 'pages.dart';

class DetailExercisePage extends StatelessWidget {
  const DetailExercisePage({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => Scaffold(
          appBar: AppBar(
            title: Text(language['Detail exercise']!),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text(language['Username']!),
                subtitle: Text(exercise.username),
              ),
              ListTile(
                title: Text(language['Weight']!),
                subtitle: Text(Language.getInstance().getValue('{0} Kg', [exercise.weight.toThousandFormat(fractionalDigits: 2)])!),
              ),
              ListTile(
                title: Text(language['Exercise time']!),
                subtitle: Text(Language.getInstance().getValue('{0} Hour', [exercise.time.toThousandFormat(fractionalDigits: 2)])!),
              ),
              ListTile(
                title: Text(language['Exercise type']!),
                subtitle: Text(language[exercise.exerciseType.text]!),
              ),
              ListTile(
                title: Text(language['Calories burned']!),
                subtitle: Text(Language.getInstance().getValue('{0} kcal', [exercise.caloriesBurned.toThousandFormat(fractionalDigits: 2)])!),
              ),
              ListTile(
                title: Text(language['Date']!),
                subtitle: Text(exercise.date.toFormattedDate(withWeekday: true, withMonthName: true, withHour: true)),
              ),
            ],
          ),
        ),
      );
}
