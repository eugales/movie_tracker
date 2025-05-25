// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_tracker/application/injectable/register_module.dart'
    as _i971;
import 'package:movie_tracker/application/remote_config/remote_config.dart'
    as _i509;
import 'package:movie_tracker/application/remote_config/remote_config_service.dart'
    as _i496;
import 'package:movie_tracker/application/remote_config/remote_config_view_model.dart'
    as _i131;
import 'package:movie_tracker/features/movie/data/datasources/local_movie_datasource.dart'
    as _i65;
import 'package:movie_tracker/features/movie/data/datasources/remote_movie_datasource.dart'
    as _i939;
import 'package:movie_tracker/features/movie/data/repositories/movie_repository_impl.dart'
    as _i565;
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart'
    as _i327;
import 'package:movie_tracker/features/movie/domain/usecases/add_movie_usecase.dart'
    as _i698;
import 'package:movie_tracker/features/movie/domain/usecases/delete_movie_usecase.dart'
    as _i440;
import 'package:movie_tracker/features/movie/domain/usecases/get_all_movies_usecase.dart'
    as _i783;
import 'package:movie_tracker/features/movie/domain/usecases/update_movie_usecase.dart'
    as _i582;
import 'package:movie_tracker/features/settings/data/datasources/local_settings_datasource.dart'
    as _i1009;
import 'package:movie_tracker/features/settings/data/repositories/settings_repository_impl.dart'
    as _i235;
import 'package:movie_tracker/features/settings/domain/repositories/settings_repository.dart'
    as _i487;
import 'package:movie_tracker/features/settings/domain/usecases/load_settings.dart'
    as _i769;
import 'package:movie_tracker/features/settings/domain/usecases/save_settings.dart'
    as _i487;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i345.FirebaseDatabase>(() => registerModule.database);
    gh.factory<_i496.RemoteConfigService>(
      () => _i496.RemoteConfigService(gh<_i345.FirebaseDatabase>()),
    );
    gh.factory<_i1009.LocalSettingsDatasource>(
      () => _i1009.LocalSettingsDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i65.LocalMovieDatasource>(
      () => _i65.LocalMovieDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i487.SettingsRepository>(
      () => _i235.SettingsRepositoryImpl(gh<_i1009.LocalSettingsDatasource>()),
    );
    gh.singleton<_i131.RemoteConfigViewModel>(
      () => _i131.RemoteConfigViewModel(gh<_i509.RemoteConfigService>()),
    );
    gh.factory<_i939.RemoteMovieDatasource>(
      () => _i939.RemoteMovieDatasourceImpl(gh<_i345.FirebaseDatabase>()),
    );
    gh.factory<_i327.MovieRepository>(
      () => _i565.MovieRepositoryImpl(
        gh<_i65.LocalMovieDatasource>(),
        gh<_i939.RemoteMovieDatasource>(),
      ),
    );
    gh.factory<_i769.LoadSettingsUseCase>(
      () => _i769.LoadSettingsUseCase(gh<_i487.SettingsRepository>()),
    );
    gh.factory<_i487.SaveSettingsUseCase>(
      () => _i487.SaveSettingsUseCase(gh<_i487.SettingsRepository>()),
    );
    gh.factory<_i698.AddMovieUseCase>(
      () => _i698.AddMovieUseCase(gh<_i327.MovieRepository>()),
    );
    gh.factory<_i582.UpdateMovieUseCase>(
      () => _i582.UpdateMovieUseCase(gh<_i327.MovieRepository>()),
    );
    gh.factory<_i440.DeleteMovieUseCase>(
      () => _i440.DeleteMovieUseCase(gh<_i327.MovieRepository>()),
    );
    gh.factory<_i783.GetAllMoviesUseCase>(
      () => _i783.GetAllMoviesUseCase(gh<_i327.MovieRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i971.RegisterModule {}
