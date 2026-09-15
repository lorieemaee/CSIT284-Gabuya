import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  // 1. We require a function from quiz.dart to collect the answer
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // 3. This function moves to the next question
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); 
    setState(() {
      currentQuestionIndex++; //balhin to next question
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Text(
                currentQuestion.text,
                style: const TextStyle(
                  color: Color(0xFF1D2335), 
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  height: 1.4, 
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  }, 
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}