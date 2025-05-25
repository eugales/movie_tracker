import 'package:flutter/material.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/presentation/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  final String id;
  const MovieDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final movie = context.watch<MovieViewModel>().getMovieById(id);

    if (movie == null) {
      return const Scaffold(
        body: Center(child: Text('Фильм не найден')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Статус: ${movie.status == MovieStatus.watched ? 'Просмотрено' : 'В планах'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Отзыв:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              movie.review.isEmpty ? 'Нет отзыва' : movie.review,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
