part of 'pages.dart';

class DetailEatPage extends StatelessWidget {
  const DetailEatPage({
    super.key,
    required this.eat,
  });

  final Eat eat;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => Scaffold(
          appBar: AppBar(
            title: Text(language['Detail eat']!),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text(language['Username']!),
                subtitle: Text(eat.username),
              ),
              ListTile(
                title: Text(language['Food name']!),
                subtitle: Text(eat.name),
              ),
              ListTile(
                title: Text(language['Calory']!),
                subtitle: Text(Language.getInstance().getValue('{0} kcal', [eat.calory.toThousandFormat(fractionalDigits: 2)])!),
              ),
              ListTile(
                title: Text(language['Date']!),
                subtitle: Text(eat.date.toFormattedDate(withWeekday: true, withMonthName: true, withHour: true)),
              ),
            ],
          ),
        ),
      );
}
