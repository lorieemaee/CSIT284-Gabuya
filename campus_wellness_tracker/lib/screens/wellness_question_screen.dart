import 'package:flutter/material.dart';

import '../data/wellness_questions.dart';
import '../models/wellness_question.dart';
import '../theme/app_theme.dart';
import '../widgets/answer_choice_tile.dart';

class WellnessQuestionScreen extends StatelessWidget {
  const WellnessQuestionScreen({
    super.key,
    required this.questionIndex,
    required this.selectedScore,
    required this.onSelect,
    required this.onContinue,
  });

  final int questionIndex;
  final int? selectedScore;
  final ValueChanged<int> onSelect;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final question = wellnessQuestions[questionIndex];
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape =
        screenSize.width > screenSize.height && screenSize.width >= 560;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 12, bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'QUESTION ${questionIndex + 1} OF ${wellnessQuestions.length}',
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.15,
                ),
              ),
              Text(
                '${((questionIndex + 1) / wellnessQuestions.length * 100).round()}%',
                style: const TextStyle(
                  color: Color(0xFF72827A),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: (questionIndex + 1) / wellnessQuestions.length,
              minHeight: 7,
              backgroundColor: const Color(0xFFE7EDE8),
              color: AppColors.green,
            ),
          ),
          const SizedBox(height: 28),
          if (isLandscape)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildQuestionIntro(question)),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: [
                      _buildAnswerChoices(question, grid: true),
                      const SizedBox(height: 18),
                      _buildContinueButton(),
                      const SizedBox(height: 15),
                      _buildPrivacyNote(),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuestionIntro(question),
                const SizedBox(height: 22),
                _buildAnswerChoices(question, grid: false),
                const SizedBox(height: 18),
                _buildContinueButton(),
                const SizedBox(height: 15),
                _buildPrivacyNote(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionIntro(WellnessQuestion question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.mint,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(question.icon, color: AppColors.green, size: 25),
        ),
        const SizedBox(height: 18),
        Text(
          question.category,
          style: const TextStyle(
            color: Color(0xFF78877F),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          question.prompt,
          style: const TextStyle(
            fontSize: 29,
            height: 1.16,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.1,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          question.subtitle,
          style: const TextStyle(
            color: Color(0xFF718078),
            fontSize: 14,
            height: 1.45,
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerChoices(
    WellnessQuestion question, {
    required bool grid,
  }) {
    if (grid) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: question.choices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 74,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final choiceIndex = (index % 2) * 2 + index ~/ 2;
          final choice = question.choices[choiceIndex];
          return AnswerChoiceTile(
            choice: choice,
            selected: selectedScore == choice.score,
            onTap: () => onSelect(choice.score),
          );
        },
      );
    }

    return Column(
      children: [
        for (final choice in question.choices) ...[
          AnswerChoiceTile(
            choice: choice,
            selected: selectedScore == choice.score,
            onTap: () => onSelect(choice.score),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: selectedScore == null ? null : onContinue,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.green,
          disabledBackgroundColor: const Color(0xFFDCE4DF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionIndex == wellnessQuestions.length - 1
                  ? 'See my summary'
                  : 'Continue',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_rounded, size: 19),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyNote() {
    return const Center(
      child: Text(
        'Your check-in is private and just for you.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFF849189), fontSize: 12),
      ),
    );
  }
}
