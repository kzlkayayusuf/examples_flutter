
import 'package:test_app/examples/question.dart';

class QuizBrain{

  int _questionNumber=0;

  final List<Question> _questionBank= [
    Question(questionText: 'soru1', questionAnswer: false),
    Question(questionText: 'soru2', questionAnswer: false),
    Question(questionText: 'soru3', questionAnswer: false),
    Question(questionText: 'soru4', questionAnswer: false),
  ];

  void nextQuestion(){
    if(_questionNumber <_questionBank.length -1 ){
      _questionNumber++;
    }else{
      _questionNumber=0;
    }
  }

  void reset(){
    _questionNumber=0;
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  int questionNumber(){
    return _questionBank.length;
  }

  bool isLastQuestion() => _questionNumber+1 != _questionBank.length ? false : true;

}