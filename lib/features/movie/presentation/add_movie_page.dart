import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/features/movie/domain/entities/movie.dart';
import 'package:movie_tracker/features/movie/presentation/movie_view_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  final _titleController = TextEditingController();
  final _reviewController = TextEditingController();
  bool _isWatched = false;

  @override
  Widget build(BuildContext context) {
    final movieVM = context.read<MovieViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Добавить фильм')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            SwitchListTile(
              title: const Text('Просмотрено'),
              value: _isWatched,
              onChanged: (val) => setState(() => _isWatched = val),
            ),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Отзыв'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final movie = Movie(
                  id: const Uuid().v4(),
                  title: _titleController.text.trim(),
                  status: _isWatched ? MovieStatus.watched : MovieStatus.notWatched,
                  review: _reviewController.text.trim(),
                );
                await movieVM.addMovie(movie);
                if (context.mounted) context.pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
