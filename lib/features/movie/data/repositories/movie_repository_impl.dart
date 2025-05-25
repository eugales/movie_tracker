import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart';

import '../datasources/local_movie_datasource.dart';
import '../datasources/remote_movie_datasource.dart';
import '../models/movie_model.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final LocalMovieDatasource local;
  final RemoteMovieDatasource remote;

  MovieRepositoryImpl(this.local, this.remote);

  @override
  Future<List<Movie>> getAllMovies() async {
    // 1. Локально
    final localMovies = await local.getMovies();
    if (localMovies.isNotEmpty) return localMovies.map((e) => e.toEntity()).toList();

    try {
      // 2. Удалённо
      final remoteMovies = await remote.fetchMovies();
      await local.saveMovies(remoteMovies); // сохранить локально
      return remoteMovies.map((e) => e.toEntity()).toList();
    } catch (_) {
      // 3. fallback — пустой список
      return [];
    }
  }

  @override
  Future<void> addMovie(Movie movie) async {
    final newModel = MovieModel.fromEntity(movie);
    final current = await local.getMovies();
    final updated = [...current, newModel];
    await local.saveMovies(updated);
    // await remote.uploadMovie(newModel); // Данные не сохраняются при перезапуске.
  }

  @override
  Future<void> updateMovie(Movie movie) async {
    final model = MovieModel.fromEntity(movie);
    final updated = (await local.getMovies())
        .map((e) => e.id == model.id ? model : e)
        .toList();
    await local.saveMovies(updated);
    await remote.updateMovie(model);
  }

  @override
  Future<void> deleteMovie(String id) async {
    final updated = (await local.getMovies())
        .where((e) => e.id != id)
        .toList();
    await local.saveMovies(updated);
    await remote.deleteMovie(id);
  }
}
