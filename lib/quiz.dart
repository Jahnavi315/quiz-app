import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  var activeScreen = 'start-screen';
  void switchState(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void addAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='result-screen';
      });
    }
  }
  void restartQuiz(){
    selectedAnswers=[];
    setState(() {
      activeScreen='questions-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchState);
    if(activeScreen=='questions-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: addAnswer);
    }else if(activeScreen=='result-screen'){
      screenWidget=ResultScreen(chossenAnswers: selectedAnswers,restart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 109, 15, 168)
              ]
              )
          ),
          child: screenWidget,
        )
        ),
    );
  }
}
/*@override
  void initState() {
    super.initState();//super class call first- better
    activeScreen= StartScreen(switchState);
  }
  Widget? activeScreen;*/
//activeScreen = const QuestionScreen();