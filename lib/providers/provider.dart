import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_artifitia/models/api_model.dart';
import 'package:quiz_artifitia/services/api_service.dart';

@immutable
class QuizData {
  final List<ApiModel>? questions;
  final int currentQuestionIndex;
  final int selectedOption;
  final int mark;

  const QuizData({
    required this.mark,
    required this.currentQuestionIndex,
    required this.questions,
    required this.selectedOption,
  });

  QuizData copyWith({
    List<ApiModel>? questions,
    int? currentQuestionIndex,
    int? selectedOption,
    int? mark,
  }) {
    return QuizData(
      mark: mark ?? this.mark,
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
      mark: 0,
      currentQuestionIndex: 0,
      questions: null,
      selectedOption: -1,
    );
  }

  void highlightCorrectOption() {
    int correctOption = getCorrectOptionIndex();
    state = state.copyWith(selectedOption: correctOption);
  }

  void timesUp() {
    state = state.copyWith(
      currentQuestionIndex: state.currentQuestionIndex + 1,
      selectedOption: -1,
    );
  }

  Future<void> getQuestionData() async {
    state = state.copyWith(questions: (await ApiService().getData()));
  }

  int getCorrectOptionIndex() {
    for (int i = 0;
        i < state.questions![state.currentQuestionIndex].options.length;
        i++) {
      if (state.questions![state.currentQuestionIndex].options[i].isCorrect) {
        return i;
      }
    }

    return 0;
  }

  /// Select option with given index
  void selectOption(int optionIndex) {
    int correctOption = getCorrectOptionIndex();
    if (optionIndex == correctOption) {
      state = state.copyWith(mark: state.mark + 1);
    }
    state = state.copyWith(selectedOption: optionIndex);
  }

  void questionincrement() {
    state =
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
  }

  void resetOnNext() {
    state = state.copyWith(selectedOption: -1);
  }

  void tryAgain() {
    state = state.copyWith(currentQuestionIndex: 0, selectedOption: -1);
  }
}

final quizProvider =
    NotifierProvider<QuizNotifier, QuizData>(() => QuizNotifier());
