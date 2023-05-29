import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({required this.onSelectAnswer,super.key});
  final void Function(String) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuestionIndex=0;
  //var currentQuestion=questions[currentQuestionIndex]; it cant be done here ,should be done inside of a method
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    var currentQuestion=questions[currentQuestionIndex];
    return SizedBox(//alternative of using center
      width: double.infinity,//use as much width as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //configuring column
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch ,//stretches out as much as possible
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center ,
              //visit fonts.google.com
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 217, 129, 234),
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item){//spread operator is used since children need list of widgets
              return AnswerButton(
                text: item, 
                onTap: (){
                  answerQuestion(item);
                }
                );
            }),
          ],
        ),
      ),
    );
  }
}