import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';

class LoadingWidget extends StatelessWidget {
  final int timervalue;
  const LoadingWidget({super.key, required this.timervalue});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: [
      Transform.rotate(
        angle: pi,
        child: LinearProgressIndicator(
          color: timervalue < 10 ? wrongColor : const Color(0xffC353D6),
          borderRadius: BorderRadius.circular(R.sw(50, context)),
          backgroundColor: const Color(0xff6C2677),
          minHeight: R.sh(30, context),
          value: (60 - timervalue) / 60,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: R.sw(10, context)),
        child: Text(
          timervalue.toString(),
          style: const TextStyle(color: whiteColor),
        ),
      ),
    ]);
  }
}
