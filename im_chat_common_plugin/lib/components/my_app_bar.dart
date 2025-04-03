import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Key? key,
    Widget? leading,
    Color? backgroundColor,
    List<Widget>? actions,
    int? progress,
    Widget? title,
  }) : super(
            key: key,
            leading: leading,
            actions: actions,
            backgroundColor: backgroundColor,
            title: title,
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color(0xFFe0e0e0), blurRadius: 6.0),
                    ],
                    color: Color(0xFFe0e0e0),
                  ),
                  height: (progress != null && progress < 100) ? 3.0 : 1.0,
                  child: (progress != null && progress < 100)
                      ? StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: progress,
                          size: 3,
                          padding: 0,
                          // blendMode: BlendMode.modulate,
                          selectedColor: Colors.blue,
                          unselectedColor: Colors.grey,
                        )
                      : null,
                )));
}
