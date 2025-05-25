import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Список фильмов')),
    body: Center(child: Text('Список')),
  );
}
