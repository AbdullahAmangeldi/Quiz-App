import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    Color colorCorrect = const Color.fromRGBO(118, 190, 248, 1.0);
    Color colorWrong = const Color.fromRGBO(254, 104, 244, 1.0);
    TextStyle defaultTextStyle(Color color) {
      return GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        color: color,
      );
    }

    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: summaryData
                .map(
                  (e) => Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            (e['user_answer'] == e['correct_answer']
                                ? colorCorrect
                                : colorWrong),
                        child: Text(
                          ((e['question_index'] as int) + 1).toString(),
                          style: defaultTextStyle(Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              e['question'] as String,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            (e['user_answer'] != e['correct_answer']
                                ? Text(e['user_answer'] as String,
                                    style: defaultTextStyle(colorWrong))
                                : const SizedBox()),
                            Text(
                              e['correct_answer'] as String,
                              style: defaultTextStyle(colorCorrect),
                            ),
                            const SizedBox(
                              height: 35,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
