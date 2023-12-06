part of 'fragments.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    if (MyApp.homeBloc.state is HomeInitial) {
      MyApp.homeBloc.add(InitializeHomeData());
    }

    return ValueListenableBuilder(
      valueListenable: Language.getInstance().languageNotifier,
      builder: (context, language, child) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, stateHome) {
          if (stateHome is HomeDataLoaded) {
            double caloriesIn = stateHome.eats.fold(0, (previousValue, element) => previousValue + element.calory);
            double caloriesOut = stateHome.exercises.fold(0, (previousValue, element) => previousValue + element.caloriesBurned);

            return Scaffold(
              appBar: AppBar(
                title: const Text(appName),
              ),
              body: Theme(
                data: Theme.of(context).copyWith(
                  cardTheme: CardTheme(
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kShapeMedium),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ),
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(language['The number of calories entered today']!),
                        subtitle: Text(Language.getInstance().getValue('{0} kcal', [caloriesIn.toThousandFormat(fractionalDigits: 2)])!),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Card(
                      child: ListTile(
                        title: Text(language['The number of calories out today']!),
                        subtitle: Text(Language.getInstance().getValue('{0} kcal', [caloriesOut.toThousandFormat(fractionalDigits: 2)])!),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Card(
                      child: ListTile(
                        title: Text(language['Remaining calories for the day']!),
                        subtitle: Text(Language.getInstance().getValue('{0} kcal', [(caloriesIn - caloriesOut).toThousandFormat(fractionalDigits: 2)])!),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Card(
                      child: ListTile(
                        title: Text(language['Notes']!),
                        subtitle: Text(language[caloriesIn - caloriesOut > 0 ? 'Today you have excess calories, please exercise' : 'Today you are low on calories, please eat']!),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
