import 'package:injectable/injectable.dart';

import '../models/movie_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class RemoteMovieDatasource {
  Future<List<MovieModel>> fetchMovies();
  Future<void> uploadMovie(MovieModel movie);
  Future<void> updateMovie(MovieModel movie);
  Future<void> deleteMovie(String id);
}

@Injectable(as: RemoteMovieDatasource)
class RemoteMovieDatasourceImpl implements RemoteMovieDatasource {
  final FirebaseDatabase database;

  RemoteMovieDatasourceImpl(this.database);

  DatabaseReference get _ref => database.ref('movies');

  @override
  Future<List<MovieModel>> fetchMovies() async {
    final snapshot = await _ref.get();

    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);

    return data.entries
        .map((entry) => MovieModel.fromJson(Map<String, dynamic>.from(entry.value)))
        .toList();
  }

  @override
  Future<void> uploadMovie(MovieModel movie) async {
    await _ref.child(movie.id).set(movie.toJson());
  }

  @override
  Future<void> updateMovie(MovieModel movie) async {
    await _ref.child(movie.id).update(movie.toJson());
  }

  @override
  Future<void> deleteMovie(String id) async {
    await _ref.child(id).remove();
  }
}
