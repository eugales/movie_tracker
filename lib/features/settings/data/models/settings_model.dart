import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_tracker/features/settings/domain/entities/settings.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
abstract class SettingsModel with _$SettingsModel implements Settings {
  const factory SettingsModel() =
      _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  factory SettingsModel.fromEntity(Settings settings) =>
      SettingsModel();
}

extension SettingsModelX on SettingsModel {
  Settings toEntity() => Settings();
}
