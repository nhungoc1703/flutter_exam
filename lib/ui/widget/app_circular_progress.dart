import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';

import '../../config/config.dart';

class AppCicularProgress extends StatelessWidget {
  const AppCicularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientProgressIndicator(
      radius: 20,
      duration: 2,
      strokeWidth: 15,
      gradientStops: const [
        0.4,
        0.6,
      ],
      gradientColors: const [AppColors.blue, AppColors.black],
      child: Container(),
    );
  }
}
