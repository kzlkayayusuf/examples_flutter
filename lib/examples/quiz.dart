import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_app/examples/quiz_brain.dart';

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  int correctNumber = 0, wrongNumber = 0;
  late int questionNumber;
  late double score;

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (quizBrain.isLastQuestion() == false) {
        quizBrain.nextQuestion();
        if (userPickedAnswer == correctAnswer) {
          correctNumber++;
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          wrongNumber++;
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      } else {
        if (userPickedAnswer == correctAnswer) {
          correctNumber++;
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          wrongNumber++;
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questionNumber = quizBrain.questionNumber();
        score = (correctNumber - (wrongNumber / 4)) * (100 / questionNumber);
        Alert(
            context: context,
            title: "Oyun Bitti!",
            content: Column(
              children: [
                Text('Soru Sayısı: $questionNumber'),
                Text('Doğru Sayısı: $correctNumber'),
                Text('Yanlış Sayısı: $wrongNumber'),
                Text('Puanınız: $score'),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
                  setState(() {
                    correctNumber = 0;
                    wrongNumber = 0;
                    quizBrain.reset();
                    scoreKeeper = [];
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  "Tekrar Başla",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text(
                'Doğru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text(
                'Yanlış',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
