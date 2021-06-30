import 'dart:async';

class BreathingExerciseData {
  Duration inhale;
  Duration holdAfterInhale;
  Duration exhale;
  Duration holdAfterExhale;

  BreathingExerciseData(
      {this.inhale, this.holdAfterInhale, this.exhale, this.holdAfterExhale});
}

final BreathingExerciseData extendedExhale = BreathingExerciseData(
    inhale: Duration(seconds: 4),
    holdAfterInhale: Duration(seconds: 0),
    exhale: Duration(seconds: 6),
    holdAfterExhale: Duration(seconds: 0));

final BreathingExerciseData relaxingBreath = BreathingExerciseData(
    inhale: Duration(seconds: 4),
    holdAfterInhale: Duration(seconds: 7),
    exhale: Duration(seconds: 8),
    holdAfterExhale: Duration(seconds: 0));

final BreathingExerciseData bellyBreathing = BreathingExerciseData(
    inhale: Duration(seconds: 5),
    holdAfterInhale: Duration(seconds: 0),
    exhale: Duration(seconds: 5),
    holdAfterExhale: Duration(seconds: 0));

final BreathingExerciseData boxBreathing = BreathingExerciseData(
    inhale: Duration(seconds: 4),
    holdAfterInhale: Duration(seconds: 4),
    exhale: Duration(seconds: 4),
    holdAfterExhale: Duration(seconds: 4));
