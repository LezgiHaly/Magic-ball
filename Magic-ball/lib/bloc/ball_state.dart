/// Состояния приложения

class BallState {}

class BallInitial extends BallState {}

class BallLoad extends BallState {
  final String title;
  BallLoad({required this.title});
}

class BallLoading extends BallState {}

class BallStop extends BallState {}

class BallError extends BallState {
  final String title;
  BallError({required this.title});
}
