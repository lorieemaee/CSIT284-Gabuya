import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'package:lab_act_3/data/questions.dart';

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
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
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