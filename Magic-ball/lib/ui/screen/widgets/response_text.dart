import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';
import 'package:surf_flutter_courses_template/assets/styles.dart';

/// Текст ответа
class ResponseText extends StatelessWidget {
  final String responseText;
  // final double opacity;
  // final Curve curve;
  // final Duration duration;
  const ResponseText(
    String title, {
    super.key,
    required this.responseText,
    // required this.opacity,
    // required this.curve,
    // required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: Text(
        responseText,
        style: AppTypography.textText56Regular
            .copyWith(color: AppColors.colorWhite),
        textAlign: TextAlign.center,
      ),
    );
  }
}
