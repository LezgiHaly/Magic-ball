import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';
import 'package:surf_flutter_courses_template/assets/strings.dart';
import 'package:surf_flutter_courses_template/assets/styles.dart';

/// Текст внизу экрана
class TapText extends StatelessWidget {
  final double opacity;
  final Curve curve;
  final Duration duration;
  const TapText(
      {super.key,
      required this.opacity,
      required this.curve,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: AnimatedOpacity(
        opacity: opacity,
        curve: curve,
        duration: duration,
        child: Text(
          AppString.tapOrShake,
          style: AppTypography.textText16Regular
              .copyWith(color: AppColors.colorGrey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
