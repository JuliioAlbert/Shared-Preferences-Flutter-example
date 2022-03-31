import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferencesapp/ui/widgets/widgets.dart';

import '../../domain/bloc/ui/ui_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomeScreen"),
        ),
        drawer: const SideMenuDrawer(),
        body: BlocBuilder<UiBloc, UiState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("isDarkMode: ${state.isDarkMode} "),
                const Divider(),
                const Text("Genero:"),
                const Divider(),
                const Text("Nombre:"),
              ],
            );
          },
        ));
  }
}
