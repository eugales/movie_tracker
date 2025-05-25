import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/settings/data/datasources/local_settings_datasource.dart';
import 'package:movie_tracker/features/settings/domain/entities/settings.dart';
import 'package:movie_tracker/features/settings/domain/repositories/settings_repository.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final LocalSettingsDatasource localDatasource;

  SettingsRepositoryImpl(this.localDatasource);

  @override
  Future<Settings> loadSettings() async {
    final prefs = await localDatasource.getPreferences();

    if (prefs != null) return prefs;

    // fallback
    return const Settings();
  }

  @override
  Future<void> saveSettings(Settings settings) {
    return localDatasource.savePreferences(settings);
  }
}