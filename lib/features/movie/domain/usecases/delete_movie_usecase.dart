import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart';

@injectable
class DeleteMovieUseCase {
  final MovieRepository repository;

  DeleteMovieUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteMovie(id);
  }
}
