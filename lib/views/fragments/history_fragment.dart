part of 'fragments.dart';

class HistoryFragment extends StatefulWidget {
  const HistoryFragment({super.key});

  @override
  State<HistoryFragment> createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: MyApp.historyBloc.state is HistoryDataLoaded ? (MyApp.historyBloc.state as HistoryDataLoaded).currentTabIndex : 0,
    )..addListener(() => MyApp.historyBloc.add(SetHistoryTabIndex(value: _tabController.index)));
    if (MyApp.historyBloc.state is HistoryInitial) {
      MyApp.historyBloc.add(InitializeHistoryData());
    }
  }

  Future<void> _onRefresh() async {
    Completer<bool> completer = Completer();

    MyApp.historyBloc.add(InitializeHistoryData(completer: completer));

    await completer.future;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, stateHistory) {
            if (stateHistory is HistoryDataLoaded) {
              return SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: DateRangeField(
                                value: stateHistory.date,
                                firstDate: DateTime(1970),
                                lastDate: DateTime.now(),
                                decoration: InputDecoration(
                                  labelText: language['Date']!,
                                ),
                                readOnly: true,
                                onDateChanged: (value) => MyApp.historyBloc.add(SetHistoryDate(value: value!)),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: IconButton.outlined(
                                onPressed: () => ModalDraggableScrollableSheet.show(
                                  builder: (context) => ModalDraggableScrollableSheet(
                                    maxChildSize: 0.9,
                                    initialChildSize: 0.9,
                                    minChildSize: 0.2,
                                    builder: (context, scrollController) => ListView(
                                      controller: scrollController,
                                      children: [
                                        // Eat
                                        const SizedBox(height: 16.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            language['Eat']!,
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        ListTile(
                                          title: Text(language['Total food']!),
                                          trailing: Text(
                                            stateHistory.eats.length.toThousandFormat(),
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(language['Total calories']!),
                                          trailing: Text(
                                            Language.getInstance().getValue('{0} kcal', [stateHistory.eats.fold(0.0, (previousValue, element) => previousValue + element.calory).toThousandFormat()])!,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        const Divider(),
                                        // Exercise
                                        const SizedBox(height: 16.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            language['Exercise']!,
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                        ListTile(
                                          title: Text(language['Total exercise']!),
                                          trailing: Text(
                                            stateHistory.exercises.length.toThousandFormat(),
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(language['Total hour']!),
                                          trailing: Text(
                                            Language.getInstance().getValue('{0} Hour', [stateHistory.exercises.fold(0.0, (previousValue, element) => previousValue + element.time).toThousandFormat(fractionalDigits: 2)])!,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(language['Total calories burned']!),
                                          trailing: Text(
                                            Language.getInstance().getValue('{0} kcal', [stateHistory.exercises.fold(0.0, (previousValue, element) => previousValue + element.caloriesBurned).toThousandFormat(fractionalDigits: 2)])!,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    ),
                                  ),
                                ),
                                icon: const Icon(Icons.summarize),
                                tooltip: language['Summary']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeader(
                        builder: (context, shrinkOffset, overlapsContent) => Container(
                          color: Theme.of(context).colorScheme.surface,
                          child: Material(
                            color: Colors.transparent,
                            child: TabBar(
                                controller: _tabController,
                                tabs: ['Eat', 'Exercise']
                                    .map(
                                      (e) => Tab(
                                        text: language[e]!,
                                      ),
                                    )
                                    .toList()),
                          ),
                        ),
                        maxExtent: 48.0,
                        minExtent: 48.0,
                        rebuild: (oldDelegate, newDelegate) => false,
                      ),
                    ),
                  ],
                  body: stateHistory.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : TabBarView(
                          controller: _tabController,
                          children: [
                            // Eat
                            stateHistory.eats.isEmpty
                                ? RetryButton(
                                    titleText: language['No data']!,
                                    onRetryPressed: () => MyApp.historyBloc.add(InitializeHistoryData()),
                                  )
                                : RefreshIndicator(
                                    onRefresh: _onRefresh,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        Eat eat = stateHistory.eats[index];

                                        return Column(
                                          children: [
                                            if (index == 0) const SizedBox(height: 8.0),
                                            ListTile(
                                              title: Text(eat.name),
                                              subtitle: Text('${Language.getInstance().getValue('{0} kcal', [eat.calory.toThousandFormat()])}\n${eat.date.toFormattedDate(withWeekday: true, withMonthName: true, withHour: true)}'),
                                              isThreeLine: true,
                                              onTap: () => NavigationHelper.to(MaterialPageRoute(builder: (context) => DetailEatPage(eat: eat))),
                                            ),
                                            const Divider(),
                                          ],
                                        );
                                      },
                                      itemCount: stateHistory.eats.length,
                                    ),
                                  ),
                            // Exercise
                            stateHistory.exercises.isEmpty
                                ? RetryButton(
                                    titleText: language['No data']!,
                                    onRetryPressed: () => MyApp.historyBloc.add(InitializeHistoryData()),
                                  )
                                : RefreshIndicator(
                                    onRefresh: _onRefresh,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        Exercise exercise = stateHistory.exercises[index];

                                        return Column(
                                          children: [
                                            if (index == 0) const SizedBox(height: 8.0),
                                            ListTile(
                                              title: Text(Language.getInstance().getValue('{0} Hour', [exercise.time.round()])!),
                                              subtitle: Text('${Language.getInstance().getValue('{0} kcal', [exercise.caloriesBurned.toThousandFormat()])!}\n${exercise.date.toFormattedDate(withWeekday: true, withMonthName: true, withHour: true)}'),
                                              isThreeLine: true,
                                              onTap: () => NavigationHelper.to(MaterialPageRoute(builder: (context) => DetailExercisePage(exercise: exercise))),
                                            ),
                                            const Divider(),
                                          ],
                                        );
                                      },
                                      itemCount: stateHistory.exercises.length,
                                    ),
                                  ),
                          ],
                        ),
                ),
              );
            } else if (stateHistory is HistoryError) {
              return ErrorOccuredButton(onRetryPressed: () => MyApp.historyBloc.add(InitializeHistoryData()));
            }

            return const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      );
}
