import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget{
  const SummaryItem(this.dataItem,{super.key});
  final Map<String,Object> dataItem;

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = dataItem['user-answer']==dataItem['crct-answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrect: isCorrect, 
            qIndex: dataItem['question-index'] as int
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataItem['question'] as String,
                    style: const TextStyle( 
                      fontSize: 15
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    dataItem['user-answer'] as String,
                    style: const TextStyle( 
                      color:  Color.fromARGB(255, 250, 130, 240),
                      fontSize: 15
                    ),
                  ),
                  Text(
                    dataItem['crct-answer'] as String,
                    style: const TextStyle( 
                      color: Color.fromARGB(255, 150, 190, 240),
                      fontSize: 15
                    ),
                  )
                ]
                )
            )
        ],
      ),
    );
  }
}