import 'package:flutter/material.dart';
import 'package:movie_tracker/application/theme/theme_state.dart';
import 'package:movie_tracker/application/theme/theme_view_model.dart';
import 'package:movie_tracker/features/settings/presentation/widgets/theme_selector_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();
    final themeMode = switch (themeVM.state) {
      ThemeLoaded(:final mode) => mode,
      _ => ThemeMode.system,
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListTile(
        title: const Text('Тема'),
        subtitle: Text(_labelTheme(themeMode)),
        onTap: () => showDialog(
          context: context,
          builder: (_) => const ThemeSelectorBottomSheet(),
        ),
      ),
    );
  }

  String _labelTheme(ThemeMode mode) => switch(mode) {
    ThemeMode.light => 'Светлая',
    ThemeMode.dark => 'Темная',
    _ => 'Системная'
  };
}
