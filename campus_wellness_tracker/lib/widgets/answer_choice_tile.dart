import 'package:flutter/material.dart';

import '../models/answer_choice.dart';
import '../theme/app_theme.dart';

class AnswerChoiceTile extends StatelessWidget {
  const AnswerChoiceTile({
    super.key,
    required this.choice,
    required this.selected,
    required this.onTap,
  });

  final AnswerChoice choice;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.mint : Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: const BoxConstraints(minHeight: 66),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.green : const Color(0xFFE5EBE6),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Text(choice.emoji, style: const TextStyle(fontSize: 21)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  choice.label,
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: selected ? AppColors.green : const Color(0xFFD5DED7),
                size: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
