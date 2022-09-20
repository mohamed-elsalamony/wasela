// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/resources/asset_path.dart';
import 'package:team_projects/core/resources/constants_variables.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/style/colors.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/user/ui/subpages/help_pages/answer_question_page.dart';

import '../subpages/help_pages/ask a question.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPage();
}

class _HelpPage extends State<HelpPage> {
  String? value;
  String? make;
  String? item;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Most common questions',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  color: kBlue,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(AppAssets.setting),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              DefaultDropMenu(
                /// firebase
                ///   the question that we will be recieved and answer it
                questions: QuestionsList.question1,
                hint: "Is cash payment available?",
              ),
              SizedBox(
                height: 1.5.h,
              ),
              DefaultDropMenu(
                /// firebase
                ///   the question that we will be recieved and answer it
                questions: QuestionsList.question2,
                hint: "Can I request immediate service ?",
              ),
              SizedBox(
                height: 1.5.h,
              ),
              DefaultDropMenu(
                /// firebase
                ///   the question that we will be recieved and answer it
                questions: QuestionsList.question3,
                hint: "Do vehicle details appear on order?",
              ),
              SizedBox(
                height: 4.h,
              ),
              DefultBorderButton(
                title: 'Ask A New Question',
                onPressed: () {
                  Navigators.naviagteTo(context, AskAQuestion());
                },
                isOutline: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultDropMenu extends StatefulWidget {
  final String hint;
  final List<String> questions;

  const DefaultDropMenu({
    Key? key,
    required this.questions,
    required this.hint,
  }) : super(key: key);

  @override
  State<DefaultDropMenu> createState() => _DefaultDropMenuState();
}

class _DefaultDropMenuState extends State<DefaultDropMenu> {
  String? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2.w),
      decoration: BoxDecoration(
        color: kLightGrey,
        border: Border.all(color: Colors.black38, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            widget.hint,
            style: TextStyle(fontSize: 18),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: kBlue,
          ),
          iconSize: 36,
          isExpanded: true,
          value: item,
          items: widget.questions.map(buildMinueItem).toList(),
          onChanged: (String? value) {
            setState(() {
              item = value;
            });
            Navigators.naviagteTo(
              context,
              AnswerQuestionPage(question: value),
            );
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMinueItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
