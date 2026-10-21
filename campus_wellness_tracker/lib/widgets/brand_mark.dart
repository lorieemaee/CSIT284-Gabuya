import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    final showWordmark = MediaQuery.sizeOf(context).width > 380;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.mint,
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Icon(
            Icons.eco_rounded,
            color: AppColors.green,
            size: 21,
          ),
        ),
        if (showWordmark) ...[
          const SizedBox(width: 10),
          const Text(
            'wellspace',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
            ),
          ),
        ],
      ],
    );
  }
}
