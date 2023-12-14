import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/providers/provider.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';

class OptionWidget extends ConsumerWidget {
  final int index;

  const OptionWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionData = ref.watch(quizProvider).questions![index];

    Color bgcolor = Colors.transparent;
    if (questionData.options[index].isCorrect) {
      bgcolor = correctColor;
    } else {
      bgcolor = wrongColor;
    }

    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: R.sw(20, context)),
        decoration: BoxDecoration(
            color: bgcolor,
            border: Border.all(color: whiteColor),
            borderRadius: BorderRadius.circular(R.sw(18, context))),
        height: R.sh(54, context),
        child: Text(
          "${index + 1}. ${questionData.options[index].text}",
          style: TextStyle(color: whiteColor, fontSize: R.sw(18, context)),
        ),
      ),
    );
  }
}
