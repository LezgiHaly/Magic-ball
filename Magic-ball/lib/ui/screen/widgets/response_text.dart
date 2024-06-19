import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/color.dart';
import 'package:surf_flutter_courses_template/assets/styles.dart';

/// Текст ответа
class ResponseText extends StatefulWidget {
  final String? responseText;

  final Duration duration;
  const ResponseText({
    super.key,
    required this.responseText,
    required this.duration,
  });

  @override
  State<ResponseText> createState() => _ResponseTextState();
}

class _ResponseTextState extends State<ResponseText> {
  // @override
  @override
  Widget build(BuildContext context) {
    print(widget.responseText);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: AnimatedOpacity(
        opacity: widget.responseText == null ? 0 : 1,
        duration: widget.duration,
        child: Text(
          widget.responseText!,
          style: AppTypography.textText56Regular
              .copyWith(color: AppColors.colorWhite),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
