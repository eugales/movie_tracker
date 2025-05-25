
import 'package:flutter/material.dart';
import 'package:movie_tracker/application/theme/theme_state.dart';
import 'package:movie_tracker/application/theme/theme_view_model.dart';
import 'package:provider/provider.dart';

class ThemeSelectorBottomSheet extends StatelessWidget {
  const ThemeSelectorBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();
    // final current = themeVM.themeMode;

    final current = switch (themeVM.state) {
      ThemeLoaded(:final mode) => mode,
      _ => ThemeMode.system,
    };
    
    return AlertDialog(
      title: const Text('Выберите тему'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: const Text('Системная'),
            value: ThemeMode.system,
            groupValue: current,
            onChanged: (value) {
              themeVM.update(value!);
            },
          ),
          RadioListTile(
            title: const Text('Светлая'),
            value: ThemeMode.light,
            groupValue: current,
            onChanged: (value) {
              themeVM.update(value!);
            },
          ),
          RadioListTile(
            title: const Text('Тёмная'),
            value: ThemeMode.dark,
            groupValue: current,
            onChanged: (value) {
              themeVM.update(value!);
            },
          ),
        ],
      ),
    );
  }
}
