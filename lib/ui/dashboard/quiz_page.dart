import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kunime_app/common/enum.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/data/model/question_model.dart';
import 'package:kunime_app/data/provider/quiz_provider.dart';
import 'package:kunime_app/widgets/appbar/custom_appbar.dart';
import 'package:kunime_app/widgets/button/quiz_button.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _isAnswered = 0;
  // TIMER
  Timer _timer;
  int _start = 15;
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          _start = _start - 1;
        }
      });
    });
  }

  @override
  void initState() {
    this._startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: secondaryColor.withOpacity(0.9),
      floatingActionButton: _start == 0
          ? _buildFloatingButton(
              isDone: true,
              onPressed: () {
                Navigation.navigate(routes.QuizResultRoute);
                // setState(() {
                //   _isAnswered = 0;
                //   _start = 15;
                // });
                // this._startTimer();
              },
            )
          : SizedBox(),
      body: Column(
        children: [
          CustomAppBar(
            padding: EdgeInsets.fromLTRB(25, 10 + _top, 25, 15),
            child: Consumer<QuizProvider>(
              builder: (context, quizProvider, child) {
                return _buildAppbar(
                  context,
                  indexQuestion: quizProvider.questionPage + 1,
                  totalQuestion: quizProvider.questions.length,
                  time: _start,
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<QuizProvider>(
                    builder: (context, quizProvider, child) {
                      QuestionModel _data =
                          quizProvider.questions[quizProvider.questionPage];

                      return _buildQuestion(context, text: _data.name);
                    },
                  ),
                  Consumer<QuizProvider>(
                    builder: (context, quizProvider, child) {
                      QuestionModel _data =
                          quizProvider.questions[quizProvider.questionPage];

                      return Column(
                        children: _data.answers.map((item) {
                          AnswerType _answerType = AnswerType.None;
                          bool isCorrect = item.isCorrect;

                          if (isCorrect && _isAnswered == item.id) {
                            _answerType = AnswerType.Correct;
                          } else if (!isCorrect && _isAnswered == item.id) {
                            _answerType = AnswerType.Wrong;
                          }

                          return QuizButton(
                            text: item.answer,
                            type: _answerType,
                            disabled: _isAnswered != 0,
                            onPressed: () {
                              setState(() {
                                _isAnswered = item.id;
                                _start = 0;
                              });
                              _timer.cancel();
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildQuestion(
    BuildContext context, {
    String text,
    String image,
  }) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: image != null
          ? Image.network(image)
          : Text(
              text ?? "Question text?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            ),
    );
  }

  Container _buildFloatingButton({
    Function onPressed,
    bool isDone = false,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: greenSecondaryColor,
      ),
      child: IconButton(
        color: secondaryColor,
        iconSize: 40,
        onPressed: onPressed ?? () {},
        highlightColor: greenSecondaryColor.withOpacity(0.2),
        icon: Icon(isDone ? Icons.done : Icons.chevron_right),
      ),
    );
  }

  Row _buildAppbar(
    BuildContext context, {
    int time = 0,
    int totalQuestion = 0,
    int indexQuestion = 0,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                "assets/icons/icon_alarm.png",
                width: 25,
                height: 25,
              ),
              SizedBox(width: 10),
              Text(
                "${time}s",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8),
              )
            ],
          ),
        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "$indexQuestion / $totalQuestion",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5),
          ),
        ),
      ],
    );
  }
}
