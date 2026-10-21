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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLandscape = constraints.maxWidth > constraints.maxHeight;
            final startButton = FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const WellnessCheckInScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Text('Start Assessment'),
              ),
            );
            final studentCard = Card(
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
            );
            final introduction = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.eco_rounded, color: AppColors.green, size: 56),
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
              ],
            );

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: isLandscape
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: introduction),
                            const SizedBox(width: 32),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  studentCard,
                                  const SizedBox(height: 16),
                                  startButton,
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            introduction,
                            const SizedBox(height: 28),
                            studentCard,
                            const SizedBox(height: 24),
                            startButton,
                          ],
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