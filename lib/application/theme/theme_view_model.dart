import 'package:flutter/material.dart';
import 'theme_service.dart';
import 'theme_state.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeService _service;
  ThemeState _state = ThemeInitial();

  ThemeState get state => _state;

  ThemeViewModel(this._service);

  Future<void> load() async {
    _state = ThemeLoading();
    notifyListeners();

    try {
      final mode = await _service.loadThemeMode();
      _state = ThemeLoaded(mode: mode);
    } catch (e) {
      _state = ThemeFailure(e.toString());
    }

    notifyListeners();
  }

  Future<void> update(ThemeMode mode) async {
    await _service.saveThemeMode(mode);
    _state = ThemeLoaded(mode: mode);
    notifyListeners();
  }
}
