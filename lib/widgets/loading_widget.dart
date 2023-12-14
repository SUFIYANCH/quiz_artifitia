import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: [
      Transform.rotate(
        angle: pi,
        child: LinearProgressIndicator(
          color: const Color(0xffC353D6),
          borderRadius: BorderRadius.circular(R.sw(50, context)),
          backgroundColor: const Color(0xff6C2677),
          minHeight: R.sh(30, context),
          value: 0.5,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: R.sw(10, context)),
        child: const Text(
          "40",
          style: TextStyle(color: whiteColor),
        ),
      ),
    ]);
  }
}
