import 'package:flutter/material.dart';
import 'package:scmia_eprom/Widgets/option_tile.dart';
import 'package:scmia_eprom/Widgets/question_card.dart';
import 'package:scmia_eprom/constants.dart';

class PatientQuestionnaireScreen extends StatefulWidget {
  PatientQuestionnaireScreen({super.key, required this.questions});

  Map<String, List<String>> questions;

  @override
  State<PatientQuestionnaireScreen> createState() =>
      _PatientQuestionnaireScreenState();
}

class _PatientQuestionnaireScreenState
    extends State<PatientQuestionnaireScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background_gray,
        // app bar -------------------------

        // body -------------------------
        body: Container(
          child: questionList(widget.questions),
        ),
      ),
    );
  }

  Widget questionList(Map<String, List<String>> questions) {
    return ListView.builder(
      // controller: chatScrollController,
      // physics: const BouncingScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        var question = questions.entries.elementAt(index);
        // return questionItem(question.key, question.value, index);
        return QuestionCard(
            question: question.key,
            options: question.value,
            onOptionSelected: (value) =>
                print("question ${index} picked option ${value}"));
      },
    );
  }

  Widget questionItem(String question, List<String> options, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).height * 0.81),
          padding:
              const EdgeInsets.only(top: 30, left: 21, right: 21, bottom: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: theme_dark, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: question_style,
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options
                    .map((option) => OptionTile(
                        option: option, index: options.indexOf(option) + 1))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
