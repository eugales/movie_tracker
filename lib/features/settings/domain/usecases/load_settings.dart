import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/settings/domain/repositories/settings_repository.dart';

@injectable
class LoadSettingsUseCase {
  final SettingsRepository repository;

  LoadSettingsUseCase(this.repository);

  Future<void> call() {
    return repository.loadSettings();
  }
}
