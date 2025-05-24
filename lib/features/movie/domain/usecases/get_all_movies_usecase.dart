import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart';

@injectable
class GetAllMoviesUseCase {
  final MovieRepository repository;

  GetAllMoviesUseCase(this.repository);

  Future<List<Movie>> call() {
    return repository.getAllMovies();
  }
}
