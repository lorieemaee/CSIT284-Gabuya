import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/main-logo.jiff',
            width: 300,
          ),
          const SizedBox(height: 80),
          const Text(
            'Favorite Food Finder',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1D2335), 
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),

          const Text ('Answer three questions and discover a food that matches your preferences.',
           textAlign: TextAlign.center,),

          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A7FFF), 
              foregroundColor: Colors.white,
              elevation: 8, 
              shadowColor: const Color(0xFF4A7FFF).withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), 
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow, size: 20),
                SizedBox(width: 10),
                Text('Start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}