import 'package:flutter/material.dart';

import '../models/wellness_question.dart';
import '../theme/app_theme.dart';

class WellnessScoreRow extends StatelessWidget {
  const WellnessScoreRow({
    super.key,
    required this.question,
    required this.score,
  });

  final WellnessQuestion question;
  final int score;

  @override
  Widget build(BuildContext context) {
    final choice = question.choices.firstWhere((item) => item.score == score);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(question.icon, color: AppColors.green, size: 19),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.category,
                  style: const TextStyle(
                    color: Color(0xFF829087),
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  choice.label,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${score + 1}/4',
            style: const TextStyle(
              color: AppColors.green,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
