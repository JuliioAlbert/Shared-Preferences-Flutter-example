import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferencesapp/data/repositories/preferncias_repository.dart';
import 'package:shared_preferencesapp/domain/bloc/ui/ui_bloc.dart';
import 'package:shared_preferencesapp/ui/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UiBloc>(create: (_) => UiBloc(Preferences.isDarkMode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Material App',
          initialRoute: HomeScreen.routeName,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            SettingsScreen.routeName: (_) => const SettingsScreen()
          },
          theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        );
      },
    );
  }
}
