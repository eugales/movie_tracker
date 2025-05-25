import 'package:flutter/material.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/domain/repositories/movie_repository.dart';


class MovieViewModel extends ChangeNotifier {
  final MovieRepository repository;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  MovieViewModel(this.repository);

  Future<void> loadMovies() async {
    _movies = await repository.getAllMovies();
    notifyListeners();
  }

  Future<void> addMovie(Movie movie) async {
    await repository.addMovie(movie);
    await loadMovies(); // обновить список
  }

  Future<void> updateMovie(Movie movie) async {
    await repository.updateMovie(movie);
    await loadMovies();
  }

  Future<void> deleteMovie(String id) async {
    await repository.deleteMovie(id);
    await loadMovies();
  }

  Movie? getMovieById(String id) {
    return _movies.firstWhere((m) => m.id == id);
  }
}
