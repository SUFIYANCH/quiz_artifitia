import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/providers/provider.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';
import 'package:quiz_artifitia/views/congrats_1_screen.dart';
import 'package:quiz_artifitia/widgets/loading_widget.dart';
import 'package:quiz_artifitia/widgets/options_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _timerValue = 60;
  Timer? _timer;
  @override
  void initState() {
    ref.read(quizProvider.notifier).getQuestionData();
    startTimer();
    super.initState();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);

    stopTimer();
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _timerValue -= 1;
      });

      if (_timerValue == 0) {
        stopTimer();
        ref.read(quizProvider.notifier).highlightCorrectOption();
      }
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(quizProvider).questions;

    return Scaffold(
      backgroundColor: primaryColor,
      body: switch (questions) {
        null => const Center(
            child: CircularProgressIndicator(),
          ),
        [] => const Center(
            child: Text(
              'No questions available. Please try again',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        _ => Padding(
            padding: EdgeInsets.symmetric(horizontal: R.sw(20, context)),
            child: Column(
              children: [
                SizedBox(
                  height: R.sh(100, context),
                ),
                LoadingWidget(
                  timervalue: _timerValue,
                ),
                SizedBox(
                  height: R.sh(60, context),
                ),
                Text(
                  questions[ref.watch(quizProvider).currentQuestionIndex]
                      .question,
                  style:
                      TextStyle(color: whiteColor, fontSize: R.sw(24, context)),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OptionWidget(
                        timer: _timer!,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: R.sh(14, context),
                      );
                    },
                    itemCount:
                        questions[ref.watch(quizProvider).currentQuestionIndex]
                            .options
                            .length),
                SizedBox(
                  height: R.sh(30, context),
                ),
                if (ref.watch(quizProvider).selectedOption > -1)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(R.sw(130, context), R.sh(45, context)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(R.sw(12, context))),
                          backgroundColor: whiteColor),
                      onPressed: () {
                        if (ref.watch(quizProvider).currentQuestionIndex ==
                            ref.watch(quizProvider).questions!.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctc) => const Congrats1Screen()));
                          ref.read(quizProvider.notifier).tryAgain();
                        } else {
                          ref.read(quizProvider.notifier).questionincrement();
                          setState(() {
                            _timerValue = 60;
                            startTimer();
                          });
                          ref.read(quizProvider.notifier).resetOnNext();
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: primaryColor, fontSize: R.sw(18, context)),
                      ))
              ],
            ),
          ),
      },
    );
  }
}
