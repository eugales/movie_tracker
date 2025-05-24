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
import 'package:movie_tracker/application/injectable/register_module.dart' as _i246;
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
    gh.factory<_i65.LocalMovieDatasource>(
      () => _i65.LocalMovieDatasourceImpl(gh<_i460.SharedPreferences>()),
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

class _$RegisterModule extends _i246.RegisterModule {}
