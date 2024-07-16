import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_courses_template/assets/res.dart';

/// Картинка главного экрана
class ImageWidget extends StatelessWidget {
  final double scale;
  final Duration duration;
  final void Function()? onTap;
  const ImageWidget(
      {super.key, required this.scale, required this.duration, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: double.infinity,
        child: AnimatedScale(
          scale: scale,
          duration: duration,
          curve: Curves.easeInOut,
          child: Image.asset(
            AppAssets.backImageBall,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
