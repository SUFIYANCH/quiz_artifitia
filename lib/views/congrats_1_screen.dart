import 'package:flutter/material.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';

class Congrats1Screen extends StatelessWidget {
  const Congrats1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: R.sw(50, context)),
        child: Column(
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(R.sw(30, context))),
              padding: EdgeInsets.symmetric(
                  horizontal: R.sw(24, context), vertical: R.sw(40, context)),
              child: Column(
                children: [
                  Image.asset(
                    "assets/congrats 1.png",
                    height: R.sh(95, context),
                  ),
                  Text(
                    "50% Score",
                    style: TextStyle(
                        color: wrongColor,
                        fontSize: R.sw(24, context),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Quiz Completed Successfully..!",
                    style: TextStyle(
                      fontSize: R.sw(16, context),
                    ),
                  ),
                  SizedBox(
                    height: R.sh(10, context),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "You attempt 10 questions and from that 5 answer is correct.",
                    style: TextStyle(
                        fontSize: R.sw(14, context),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
