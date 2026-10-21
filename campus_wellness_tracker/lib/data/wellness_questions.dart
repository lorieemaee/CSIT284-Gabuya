import 'package:flutter/material.dart';

import '../models/answer_choice.dart';
import '../models/wellness_question.dart';

const wellnessQuestions = <WellnessQuestion>[
  WellnessQuestion(
    category: 'REST',
    prompt: 'How did you sleep last night?',
    subtitle: 'Rest is the foundation for a good day.',
    icon: Icons.nightlight_round,
    choices: [
      AnswerChoice('Not well at all', 0, '😴'),
      AnswerChoice('A little restless', 1, '🌙'),
      AnswerChoice('Pretty well', 2, '✨'),
      AnswerChoice('Great, fully rested', 3, '☀️'),
    ],
  ),
  WellnessQuestion(
    category: 'ENERGY',
    prompt: 'How is your energy today?',
    subtitle: 'Check in with your body, without judgment.',
    icon: Icons.bolt_rounded,
    choices: [
      AnswerChoice('Running on empty', 0, '🪫'),
      AnswerChoice('A bit low', 1, '🐢'),
      AnswerChoice('Doing okay', 2, '🌿'),
      AnswerChoice('Feeling energized', 3, '⚡'),
    ],
  ),
  WellnessQuestion(
    category: 'MOOD',
    prompt: 'How have you been feeling emotionally?',
    subtitle: 'Every feeling is welcome here.',
    icon: Icons.favorite_border_rounded,
    choices: [
      AnswerChoice('Having a hard time', 0, '🌧️'),
      AnswerChoice('A little unsettled', 1, '☁️'),
      AnswerChoice('Mostly good', 2, '🌤️'),
      AnswerChoice('Really positive', 3, '🌈'),
    ],
  ),
  WellnessQuestion(
    category: 'MOVEMENT',
    prompt: 'How much have you moved your body?',
    subtitle: 'Small moments of movement count too.',
    icon: Icons.directions_walk_rounded,
    choices: [
      AnswerChoice('Not much today', 0, '🛋️'),
      AnswerChoice('A little bit', 1, '🚶'),
      AnswerChoice('A good amount', 2, '🚴'),
      AnswerChoice('Lots of movement', 3, '🏃'),
    ],
  ),
  WellnessQuestion(
    category: 'CONNECTION',
    prompt: 'How connected do you feel to others?',
    subtitle: 'Connection can be a quick text or a long chat.',
    icon: Icons.people_outline_rounded,
    choices: [
      AnswerChoice('Quite isolated', 0, '🫧'),
      AnswerChoice('A little disconnected', 1, '💭'),
      AnswerChoice('Fairly connected', 2, '💬'),
      AnswerChoice('Very connected', 3, '🤝'),
    ],
  ),
  WellnessQuestion(
    category: 'BALANCE',
    prompt: 'How manageable did your day feel?',
    subtitle: 'Think about your workload, breaks, and breathing room.',
    icon: Icons.spa_outlined,
    choices: [
      AnswerChoice('Overwhelming', 0, '🌊'),
      AnswerChoice('A bit too much', 1, '🌀'),
      AnswerChoice('Mostly manageable', 2, '🍃'),
      AnswerChoice('Well balanced', 3, '🧘'),
    ],
  ),
];
