part of 'pages.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedNavigationIndex = 0;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => Scaffold(
          floatingActionButton: _selectedNavigationIndex == 0
              ? FloatingActionButton.extended(
                  onPressed: () => NavigationHelper.to(
                    MaterialPageRoute(
                      builder: (context) => const AddActivityPage(),
                      fullscreenDialog: true,
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: Text(
                    language['Activity']!,
                  ),
                )
              : null,
          body: [
            const HomeFragment(),
            const HistoryFragment(),
            const SettingsFragment(),
          ][_selectedNavigationIndex],
          bottomNavigationBar: NavigationBar(
            destinations: List.generate(
              3,
              (index) => NavigationDestination(
                icon: Icon([
                  Icons.home_outlined,
                  Icons.history_outlined,
                  Icons.settings_outlined,
                ][index]),
                selectedIcon: Icon([
                  Icons.home,
                  Icons.history,
                  Icons.settings,
                ][index]),
                label: language[[
                  'Home',
                  'History',
                  'Settings',
                ][index]]!,
              ),
            ),
            selectedIndex: _selectedNavigationIndex,
            onDestinationSelected: (index) => setState(() => _selectedNavigationIndex = index),
          ),
        ),
      );
}
