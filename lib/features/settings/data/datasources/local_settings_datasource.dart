import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/settings/data/models/settings_model.dart';
import 'package:movie_tracker/features/settings/domain/entities/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalSettingsDatasource {
  Future<Settings?> getPreferences();
  Future<void> savePreferences(Settings settings);
}

@Injectable(as: LocalSettingsDatasource)
class LocalSettingsDatasourceImpl implements LocalSettingsDatasource {
  final SharedPreferences prefs;

  static const _settingsKey = 'settings';

  LocalSettingsDatasourceImpl(this.prefs);

  @override
  Future<Settings?> getPreferences() async {
    final themeString = prefs.getString(_settingsKey);

    if (themeString == null) return null;

    return Settings();
  }

  @override
  Future<void> savePreferences(Settings settings) async {
    await prefs.setString(_settingsKey, SettingsModel.fromEntity(settings).toJson().toString());
  }
}
