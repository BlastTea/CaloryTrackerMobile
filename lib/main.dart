import 'package:calory_tracker/blocs/blocs.dart';
import 'package:calory_tracker/services/services.dart';
import 'package:calory_tracker/utils/utils.dart';
import 'package:calory_tracker/views/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_widget/m_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Language.addData(additionalCaloryTrackerData);

  await MWidget.initialize(
    defaultLanguage: LanguageType.indonesiaIndonesian,
    defaultTheme: ThemeValue(
      themeMode: ThemeMode.dark,
      color: Colors.green[100],
      useDynamicColors: true,
      withCustomColors: true,
    ),
  );

  await DbHelper.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static AuthenticationBloc authenticationBloc = AuthenticationBloc();
  static HomeBloc homeBloc = HomeBloc();
  static AddActivityBloc addActivityBloc = AddActivityBloc();
  static HistoryBloc historyBloc = HistoryBloc();
  static ProfileBloc profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) => MWidgetThemeBuilder(
        builder: (context, theme, darkTheme, themeMode) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => authenticationBloc),
            BlocProvider(create: (context) => homeBloc),
            BlocProvider(create: (context) => addActivityBloc),
            BlocProvider(create: (context) => historyBloc),
            BlocProvider(create: (context) => profileBloc),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: theme.copyWith(
              inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
            darkTheme: darkTheme.copyWith(
              inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
            title: appName,
            debugShowCheckedModeBanner: false,
            home: const SignInPage(),
          ),
        ),
      );
}
