import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart';

@injectable
class AddMovieUseCase {
  final MovieRepository repository;

  AddMovieUseCase(this.repository);

  Future<void> call(Movie movie) {
    return repository.addMovie(movie);
  }
}
