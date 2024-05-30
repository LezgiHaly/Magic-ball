import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/assets/strings.dart';
import 'package:surf_flutter_courses_template/bloc/ball_event.dart';
import 'package:surf_flutter_courses_template/bloc/ball_state.dart';
import 'package:surf_flutter_courses_template/repositories/ipi.dart';

/// Бизнес логика))

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc() : super(BallInitial()) {
    final BallRepository apiRepositories = BallRepository();
    bool stop = false;
    Future<void> loadMagicBall(event, emit) async {
      stop = false;
      emit(BallLoading());
      final title = await apiRepositories.getString();

      if (!stop && title != AppString.eror) {
        emit(BallLoad(title: title));
      } else if (title == AppString.eror) {
        emit(BallError(title: title));
      }
    }

    Future<void> stopMagicBall(event, emit) async {
      emit(BallStop());
      stop = true;
    }

    on<LoadBall>(loadMagicBall);

    on<StopLoadBall>(stopMagicBall);
  }
}
