class Movie {
  final String id;
  final String title;
  final MovieStatus status;
  final String review;

  Movie({required this.id, required this.title, required this.status, required this.review});
}

enum MovieStatus { watched, notWatched }