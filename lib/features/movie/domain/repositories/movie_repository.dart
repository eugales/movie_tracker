import 'package:movie_tracker/features/movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getAllMovies();
  Future<void> addMovie(Movie movie);
  Future<void> updateMovie(Movie movie);
  Future<void> deleteMovie(String id);
}
