import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/models/api_model.dart';
import 'package:quiz_artifitia/services/api_service.dart';

@immutable
class QuizData {
  final List<ApiModel>? questions;
  final int currentQuestionIndex;
  final int selectedOption;

  const QuizData({
    required this.currentQuestionIndex,
    required this.questions,
    required this.selectedOption,
  });

  QuizData copyWith({
    List<ApiModel>? questions,
    int? currentQuestionIndex,
    int? selectedOption,
  }) {
    return QuizData(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}

class QuizNotifier extends Notifier<QuizData> {
  @override
  QuizData build() {
    return const QuizData(
        currentQuestionIndex: 0, questions: null, selectedOption: -1);
  }

  Future<void> getQuestionData() async {
    state = state.copyWith(questions: (await ApiService().getData()));
  }

  /// Select option with given index
  void selectOption(int optionIndex) {
    state = state.copyWith(selectedOption: optionIndex);
  }
}

final quizProvider =
    NotifierProvider<QuizNotifier, QuizData>(() => QuizNotifier());
