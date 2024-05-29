import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';
import 'package:surf_flutter_courses_template/bloc/ball_bloc.dart';
import 'package:surf_flutter_courses_template/bloc/ball_event.dart';
import 'package:surf_flutter_courses_template/bloc/ball_state.dart';
import 'package:surf_flutter_courses_template/ui/screen/widgets/image_widget.dart';
import 'package:surf_flutter_courses_template/ui/screen/widgets/response_text.dart';
import 'package:surf_flutter_courses_template/ui/screen/widgets/tap_text.dart';

/// Главный экран приложения

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> {
  final _ballBloc = BallBloc();
  late ShakeDetector detector;
  double _scale = 1.0;
  double _opacity = 1.0;
  Curve _curve = Curves.easeOutQuint;
  final Duration _duration = const Duration(milliseconds: 300);

  /// никак не смог ошибку исправить чтоб работало при тряске телефона

  // @override
  // void initState() {
  //   detector = ShakeDetector.autoStart(onPhoneShake: () {
  //     _toggleZoom();
  //   });
  //   super.initState();
  // }

  void _zoom() {
    setState(() {
      _opacity == 1
          ? _ballBloc.add(LoadBall())
          : _ballBloc.add(
              StopLoadBall(),
            );
      _scale = 2.3;
      _opacity = 0;
      _curve = _opacity == 1.0 ? Curves.easeInQuint : Curves.easeOutQuint;
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          scale: _scale,
          duration: _duration,
          onTap: _zoom,
        ),
        Positioned(
          bottom: 58,
          left: 0,
          right: 0,
          child: TapText(
            opacity: _opacity,
            curve: _curve,
            duration: _duration,
          ),
        ),
        BlocBuilder<BallBloc, BallState>(
          bloc: _ballBloc,
          builder: (context, state) {
            if (state is BallLoad) {
              return Center(
                child: ResponseText(
                  state.title,
                  responseText: state.title,
                ),
              );
            }
            if (state is BallLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.colorWhite,
              ));
            }
            if (state is BallEror) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: state.color,
                ),
                child: Text(state.title),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
