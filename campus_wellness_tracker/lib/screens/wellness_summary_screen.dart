import 'package:flutter/material.dart';

import '../data/wellness_questions.dart';
import '../theme/app_theme.dart';
import '../widgets/wellness_score_row.dart';

class WellnessSummaryScreen extends StatelessWidget {
  const WellnessSummaryScreen({
    super.key,
    required this.scores,
    required this.onStartOver,
  });

  final List<int> scores;
  final VoidCallback onStartOver;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape =
        screenSize.width > screenSize.height && screenSize.width >= 560;
    final total = scores.fold<int>(0, (sum, score) => sum + score);
    final percentage = (total / (wellnessQuestions.length * 3) * 100).round();
    final title = switch (percentage) {
      >= 80 => 'You’re doing great!',
      >= 55 => 'You’re finding your balance.',
      >= 30 => 'Be gentle with yourself.',
      _ => 'Today sounds like a lot.',
    };
    final message = switch (percentage) {
      >= 80 => 'You’ve built some good momentum. Keep making space for what helps you feel well.',
      >= 55 => 'There are some good things to hold onto, and room to care for yourself in small ways.',
      >= 30 => 'Some parts of today may feel challenging. One small act of care is enough to begin.',
      _ => 'You deserve support, especially on the harder days. Consider reaching out to someone you trust.',
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 14, bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'YOUR DAILY CHECK-IN',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.green,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          if (isLandscape)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildScoreCard(
                    percentage: percentage,
                    title: title,
                    message: message,
                    total: total,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(child: _buildWellnessBreakdown()),
              ],
            )
          else ...[
            _buildScoreCard(
              percentage: percentage,
              title: title,
              message: message,
              total: total,
            ),
            const SizedBox(height: 22),
            _buildWellnessBreakdown(),
          ],
          const SizedBox(height: 15),
          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: onStartOver,
              icon: const Icon(Icons.refresh_rounded, size: 19),
              label: const Text('Start a new check-in'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.green,
                side: const BorderSide(color: Color(0xFFB8CDC1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'This check-in is a reflection tool, not a diagnosis.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF849189), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard({
    required int percentage,
    required String title,
    required String message,
    required int total,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
      decoration: BoxDecoration(
        color: AppColors.mint,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$percentage',
                style: const TextStyle(
                  color: AppColors.green,
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.7,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF526A60),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            '$total out of ${wellnessQuestions.length * 3} points',
            style: const TextStyle(
              color: Color(0xFF526A60),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWellnessBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'YOUR WELLNESS PICTURE',
          style: TextStyle(
            color: Color(0xFF718078),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Column(
              children: [
                for (var i = 0; i < wellnessQuestions.length; i++) ...[
                  WellnessScoreRow(
                    question: wellnessQuestions[i],
                    score: scores[i],
                  ),
                  if (i < wellnessQuestions.length - 1)
                    const Divider(height: 1, color: Color(0xFFEDF0ED)),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
