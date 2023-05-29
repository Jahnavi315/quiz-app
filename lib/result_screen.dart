import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.chossenAnswers,required this.restart});
  final List<String> chossenAnswers;
  final void Function() restart;
  List<Map<String,Object>> get summaryofData{//using getter
    final List<Map<String,Object>> summaryData=[];
    for(var i=0;i<chossenAnswers.length;i++){
      summaryData.add( 
        {
          'question-index':i,
          'question':questions[i].text,
          'crct-answer':questions[i].answers[0],
          'user-answer':chossenAnswers[i]
        }
      );
    }
    return summaryData;
  }
  @override
  Widget build(BuildContext context) {  
    final totalQuestions=questions.length;
    final summaryData = summaryofData;
    //using arrow function
    final crctQuestions=summaryData.where((data)=> (data['crct-answer']==data['user-answer'])).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign : TextAlign.center,
              'You have answered $crctQuestions out of $totalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 236, 200, 250),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 50),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 50),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: restart, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                //backgroundColor: Color.fromARGB(255, 123, 24, 210) 
              ),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}