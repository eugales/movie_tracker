import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';


part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
abstract class MovieModel with _$MovieModel implements Movie {
  const factory MovieModel({
    required String id,
    required String title,
    required MovieStatus status,
    required String review,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  factory MovieModel.fromEntity(Movie movie) => MovieModel(
    id: movie.id,
    title: movie.title,
    status: movie.status,
    review: movie.review,
  );
}

extension MovieModelX on MovieModel {
  Movie toEntity() =>
      Movie(id: id, title: title, status: status, review: review);
}
