part of 'pages.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => BlocBuilder<AddActivityBloc, AddActivityState>(
          builder: (context, stateAddActivity) {
            stateAddActivity as AddActivityDataLoaded;

            return Scaffold(
              appBar: AppBar(
                title: Text(language['Add activity']!),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () => MyApp.addActivityBloc.add(AddActivityPressed()),
                icon: const Icon(Icons.done),
                label: Text(language['Add']!),
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  SegmentedButton(
                    segments: ActivityType.values
                        .map(
                          (e) => ButtonSegment(
                            value: e,
                            label: Text(language[e.text]!),
                            icon: Icon(e.icon),
                            tooltip: language[e.text],
                          ),
                        )
                        .toList(),
                    selected: {stateAddActivity.activityType},
                    onSelectionChanged: (values) => MyApp.addActivityBloc.add(SetAddActivityType(value: values.first)),
                  ),
                  const SizedBox(height: 16.0),
                  ...switch (stateAddActivity.activityType) {
                    ActivityType.eat => [
                        TextField(
                          controller: stateAddActivity.textControllerFoodName,
                          decoration: InputDecoration(
                            labelText: language['Food name']!,
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAddActivity.textControllerFoodCalory,
                          decoration: InputDecoration(
                            labelText: language['Calory']!,
                            suffixText: language['kcal'],
                          ),
                          inputFormatters: [textFormatterDoubleOnly],
                          keyboardType: TextInputType.number,
                          onEditingComplete: () => MyApp.addActivityBloc.add(AddActivityPressed()),
                        ),
                      ],
                    ActivityType.exercise => [
                        TextField(
                          controller: stateAddActivity.textControllerExerciseWeight,
                          decoration: InputDecoration(
                            labelText: language['Weight']!,
                            suffixText: language['Kg'],
                          ),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [textFormatterDoubleOnly],
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAddActivity.textControllerExerciseTime,
                          decoration: InputDecoration(
                            labelText: language['Exercise time']!,
                            suffixText: language['Hour'],
                          ),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [textFormatterDoubleOnly],
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16.0),
                        ...ExerciseType.values.map(
                          (e) => RadioListTile(
                            value: e,
                            groupValue: stateAddActivity.currentExercise.exerciseType,
                            title: Text(language[e.text]!),
                            subtitle: Text(language[e.subtitle]!),
                            isThreeLine: true,
                            onChanged: (value) => MyApp.addActivityBloc.add(SetAddActivityExerciseType(value: value!)),
                          ),
                        )
                      ],
                  }
                ],
              ),
            );
          },
        ),
      );
}
