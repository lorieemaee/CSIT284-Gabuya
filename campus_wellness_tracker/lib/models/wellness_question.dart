import 'package:flutter/material.dart';

import 'answer_choice.dart';

class WellnessQuestion {
  const WellnessQuestion({
    required this.category,
    required this.prompt,
    required this.subtitle,
    required this.icon,
    required this.choices,
  });

  final String category;
  final String prompt;
  final String subtitle;
  final IconData icon;
  final List<AnswerChoice> choices;
}
