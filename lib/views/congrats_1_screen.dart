import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/providers/provider.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';
import 'package:quiz_artifitia/views/get_started_screen.dart';

class Congrats1Screen extends ConsumerWidget {
  const Congrats1Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ((ref.watch(quizProvider).mark /
                ref.watch(quizProvider).questions!.length) *
            100)
        .round();

    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: R.sw(50, context)),
        child: Column(
          children: [
            const Spacer(),
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
                    "$score% Score",
                    style: TextStyle(
                        color: score > 50 ? correctColor : wrongColor,
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
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "You attempt ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "${ref.watch(quizProvider).questions!.length} Questions",
                            style: const TextStyle(color: Color(0xffE0547C))),
                        const TextSpan(text: " and from that "),
                        TextSpan(
                            text: "${ref.watch(quizProvider).mark} answer",
                            style: const TextStyle(color: correctColor)),
                        const TextSpan(text: " is correct."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: R.sh(30, context),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(R.sw(12, context))),
                    backgroundColor: score > 50 ? correctColor : wrongColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctc) => const GetStartedScreen()));
                },
                child: Text(
                  score > 50 ? "Back" : "Try again..!",
                  style:
                      TextStyle(color: whiteColor, fontSize: R.sw(18, context)),
                )),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
