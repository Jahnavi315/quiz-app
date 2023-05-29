import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{

  const QuestionIdentifier({super.key,required this.isCorrect,required this.qIndex});
  final bool isCorrect;
  final int qIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration:BoxDecoration(
        color: isCorrect
        ?const Color.fromARGB(255, 150, 190, 240)
        :const Color.fromARGB(255, 250, 130, 240),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        (qIndex+1).toString(),
        style:const TextStyle( 
          fontWeight: FontWeight.bold,
          color:  Color.fromARGB(255, 22, 2, 55)
        ),
      ),
    );
  }
}