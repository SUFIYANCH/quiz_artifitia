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
    final questionData = ref
        .watch(quizProvider)
        .questions![ref.watch(quizProvider).currentQuestionIndex];

    final isCorrect = questionData.options[index].isCorrect;
    final selectedOption = ref.watch(quizProvider).selectedOption;
    final isDisabled = selectedOption > -1;
    var isHighlighted = false;

    var textColor = Colors.white;
    if (isDisabled) {
      textColor = Colors.grey;
    }

    var bgcolor = Colors.transparent;
    if (selectedOption == index) {
      isHighlighted = true;
      if (isCorrect) {
        bgcolor = correctColor;
      } else {
        bgcolor = wrongColor;
      }
    }

    if (isCorrect && selectedOption > -1 && selectedOption != index) {
      isHighlighted = true;
      bgcolor = correctColor;
    }

    if (isHighlighted) {
      textColor = Colors.white;
    }

    return InkWell(
      onTap: isDisabled
          ? null
          : () {
              ref.read(quizProvider.notifier).selectOption(index);
            },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: R.sw(20, context)),
        decoration: BoxDecoration(
            color: bgcolor,
            border: !isHighlighted ? Border.all(color: textColor) : null,
            borderRadius: BorderRadius.circular(R.sw(18, context))),
        height: R.sh(54, context),
        child: Text(
          "${index + 1}. ${questionData.options[index].text}",
          style: TextStyle(color: textColor, fontSize: R.sw(18, context)),
        ),
      ),
    );
  }
}
