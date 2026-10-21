import 'package:flutter/material.dart';

import '../data/wellness_questions.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_mark.dart';
import 'wellness_question_screen.dart';
import 'wellness_summary_screen.dart';

class WellnessCheckInScreen extends StatefulWidget {
  const WellnessCheckInScreen({super.key});

  @override
  State<WellnessCheckInScreen> createState() => _WellnessCheckInScreenState();
}

class _WellnessCheckInScreenState extends State<WellnessCheckInScreen> {
  final List<int?> _answers = List<int?>.filled(wellnessQuestions.length, null);
  int _questionIndex = 0;
  bool _isComplete = false;

  void _selectAnswer(int score) {
    setState(() => _answers[_questionIndex] = score);
  }

  void _goBack() {
    if (_isComplete) {
      setState(() => _isComplete = false);
    } else if (_questionIndex > 0) {
      setState(() => _questionIndex--);
    }
  }

  void _continue() {
    if (_answers[_questionIndex] == null) return;
    setState(() {
      if (_questionIndex == wellnessQuestions.length - 1) {
        _isComplete = true;
      } else {
        _questionIndex++;
      }
    });
  }

  void _startOver() {
    setState(() {
      for (var i = 0; i < _answers.length; i++) {
        _answers[i] = null;
      }
      _questionIndex = 0;
      _isComplete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _questionIndex > 0 || _isComplete
            ? IconButton(
                tooltip: 'Go back',
                onPressed: _goBack,
                icon: const Icon(Icons.arrow_back_rounded),
              )
            : const SizedBox(width: 56),
        title: const BrandMark(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                'DAILY CHECK-IN',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 700 ? 40.0 : 22.0;
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: _isComplete
                      ? WellnessSummaryScreen(
                          scores: _answers.cast<int>(),
                          onStartOver: _startOver,
                        )
                      : WellnessQuestionScreen(
                          questionIndex: _questionIndex,
                          selectedScore: _answers[_questionIndex],
                          onSelect: _selectAnswer,
                          onContinue: _continue,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
