import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferencesapp/data/repositories/preferncias_repository.dart';
import 'package:shared_preferencesapp/domain/bloc/ui/ui_bloc.dart';
import 'package:shared_preferencesapp/ui/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  int gender = 1;
  String name = "Julio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const SideMenuDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: BlocBuilder<UiBloc, UiState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                    ),
                    const Divider(),
                    SwitchListTile.adaptive(
                      value: state.isDarkMode,
                      title: const Text("DarkMode"),
                      onChanged: (value) {
                        Preferences.isDarkMode = value;
                        context
                            .read<UiBloc>()
                            .add(OnChangeTheme(Preferences.isDarkMode));
                      },
                    ),
                    const Divider(),
                    RadioListTile<int>(
                      title: const Text("Masculino"),
                      value: gender,
                      groupValue: 1,
                      onChanged: (value) {
                        gender = value ?? 1;
                        setState(() {});
                      },
                    ),
                    const Divider(),
                    RadioListTile<int>(
                      title: const Text("Femenino"),
                      value: gender,
                      groupValue: 2,
                      onChanged: (value) {
                        gender = value ?? 2;
                        setState(() {});
                      },
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        initialValue: "Julio",
                        decoration: const InputDecoration(
                          labelText: "Nombre",
                          helperText: "Nombre del Usuario",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
