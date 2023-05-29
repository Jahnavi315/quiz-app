import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key,required this.summaryData});
  final List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
/*
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: data['crct-answer']==data['user-answer']?Colors.amber:Colors.blue,
                      shape: BoxShape.circle
                    ),
                    child: Text(
                      ((data['question-index'] as int) + 1).toString(),
                      style: const TextStyle( 
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  )
                  const SizedBox(width: 15),
                  Expanded(//restricts width of the column to width of the above row(flex)
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                        Text(
                          data['crct-answer'].toString(),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 42, 5, 72)
                          ),
                        ),
                        Text(
                          data['user-answer'].toString(),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 164, 19, 156)
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              );
*/