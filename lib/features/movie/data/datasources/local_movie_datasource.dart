import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movie_tracker/features/movie/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalMovieDatasource {
  Future<List<MovieModel>> getMovies();
  Future<void> saveMovies(List<MovieModel> movies);
}

@Injectable(as: LocalMovieDatasource)
class LocalMovieDatasourceImpl implements LocalMovieDatasource {
  static const _key = 'movies';

  final SharedPreferences prefs;

  LocalMovieDatasourceImpl(this.prefs) {
    prefs.remove(_key); // Данные не сохраняются при перезапуске.
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];

    final List decoded = json.decode(jsonString);
    return decoded.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveMovies(List<MovieModel> movies) async {
    final jsonString =
        json.encode(movies.map((e) => e.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }
}
