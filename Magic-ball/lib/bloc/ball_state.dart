import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';

/// Состояния приложения

class BallState {}

class BallInitial extends BallState {}

class BallLoad extends BallState {
  final String title;
  BallLoad({required this.title});
}

class BallLoading extends BallState {}

class BallStop extends BallState {}

class BallEror extends BallState {
  final String title;
  final Color color = AppColors.darkPurple;
  BallEror({required this.title});
}
