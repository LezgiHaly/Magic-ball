import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';
import 'package:surf_flutter_courses_template/assets/styles.dart';
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
  Curve _curveBg = Curves.easeOutQuint;
  double _opacityBg = 0;
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
      _scale = _scale == 1.0 ? 2.3 : 1.0;
      _opacity = _opacity == 1.0 ? 0 : 1.0;
      _curve = _opacity == 1.0 ? Curves.easeInQuint : Curves.easeOutQuint;
      _opacityBg = _opacityBg == 0 ? 1 : 0;
      _curveBg = _opacityBg == 0.0 ? Curves.easeOutQuint : Curves.easeInQuint;
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
        AnimatedOpacity(
          opacity: _opacityBg,
          duration: _duration,
          curve: _curveBg,
          child: BlocBuilder<BallBloc, BallState>(
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
              if (state is BallError) {
                return Center(
                    child: Text(
                  state.title,
                  style: AppTypography.textText56Regular
                      .copyWith(color: AppColors.darkPurple),
                ));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
