part of 'fragments.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text(language['Profile']!),
                onTap: () => NavigationHelper.to(MaterialPageRoute(builder: (context) => const ProfilePage())),
              ),
              const LanguageSwitcher.listTile(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(language['Logout']!),
                onTap: () async {
                  NavigationHelper.toReplacement(MaterialPageRoute(builder: (context) => const SignInPage()));
                  await Future.delayed(const Duration(milliseconds: 350));

                  MyApp.homeBloc.add(SetHomeToInitial());
                  MyApp.historyBloc.add(SetHistoryToInitial());
                },
              ),
            ],
          ),
        ),
      );
}
