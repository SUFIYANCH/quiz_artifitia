import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/providers/provider.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';
import 'package:quiz_artifitia/widgets/loading_widget.dart';
import 'package:quiz_artifitia/widgets/options_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(quizProvider.notifier).getQuestionData();
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
                const LoadingWidget(),
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
                      onPressed: () {},
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
