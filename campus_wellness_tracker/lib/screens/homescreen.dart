import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'wellness_check_in_screen.dart';

class WellnessHomeScreen extends StatelessWidget {
  const WellnessHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('wellspace')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.eco_rounded,
                    color: AppColors.green,
                    size: 56,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Campus Wellness Tracker',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Take a moment to reflect on your physical and mental health.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),

                  // Replace these placeholders with your own student details.
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Student information',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),
                          Text('Name: Daryl Mark C. Gabuya'),
                          SizedBox(height: 8),
                          Text('Program/Year: BSIT - 3rd Year'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              const WellnessCheckInScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14),
                      child: Text('Start Assessment'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}