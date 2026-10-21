import 'package:flutter/material.dart';

import 'screens/homescreen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusWellnessApp());
}

class CampusWellnessApp extends StatelessWidget {
  const CampusWellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Wellness',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WellnessHomeScreen(),
    );
  }
}
