import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/settings/domain/entities/settings.dart';
import 'package:movie_tracker/features/settings/domain/repositories/settings_repository.dart';

@injectable
class SaveSettingsUseCase {
  final SettingsRepository repository;

  SaveSettingsUseCase(this.repository);

  Future<void> call(Settings settings) {
    return repository.saveSettings(settings);
  }
}
