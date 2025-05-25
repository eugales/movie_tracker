import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/presentation/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieVM = context.watch<MovieViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильмы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/movies/add'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: movieVM.loadMovies(),
        builder: (context, snapshot) {
          final movies = movieVM.movies;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text('Статус: ${movie.status == MovieStatus.watched ? 'Просмотрено' : 'В планах'}'),
                onTap: () => context.push('/movies/${movie.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
