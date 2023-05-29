import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz ,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          /*Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),*/
          const SizedBox(
            height: 70,
          ),
          Text(
            'Learn Flutter the Fun way!',
            style: GoogleFonts.pangolin(
              color: Colors.white,
              fontSize: 24
            )
            ,
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              foregroundColor: const Color.fromARGB(255, 230, 204, 243),
            ),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            label:const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 19
              ),
            ),
          ),
        ],
      )
    );
  }
}
