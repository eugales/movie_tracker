import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeMode mode;

  ThemeLoaded({required this.mode});
}

class ThemeFailure extends ThemeState {
  final String message;

  ThemeFailure(this.message);
}
