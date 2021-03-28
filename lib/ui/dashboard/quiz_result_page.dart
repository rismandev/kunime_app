import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/sizeconfig.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/widgets/button/result_button.dart';

class QuizResultPage extends StatefulWidget {
  @override
  _QuizResultPageState createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  double _left;

  @override
  void initState() {
    _left = SizeConfig.widthMultiplier * 100;
    _startAnimated();
    super.initState();
  }

  void _startAnimated() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _left = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              _buildTitle(context),
              Image.asset(
                "assets/images/winner.png",
                width: 240,
                height: 200,
              ),
              _buildSubtitle(context),
              _buildDescription(context),
              _buildScore(context, score: "9", maxScore: "10"),
              SizedBox(height: 50),
              _buildButton(),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            bottom: 0,
            left: _left,
            right: 0,
            child: Image.asset("assets/icons/shape_bottom.png"),
          ),
        ],
      ),
    );
  }

  Row _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 15),
        Expanded(
          child: ResultButton(
            icon: "assets/icons/icon_share.png",
            text: "Bagikan",
            onPressed: () {},
          ),
        ),
        Expanded(
          child: ResultButton(
            icon: "assets/icons/icon_play.png",
            text: "Kuis Baru",
            isPrimary: true,
            onPressed: () => Navigation.pushAndRemove(routes.DashboardRoute),
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Row _buildScore(
    BuildContext context, {
    String maxScore,
    String score,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          score ?? "0",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2.copyWith(
              color: greenColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "/",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3.copyWith(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.8),
          ),
        ),
        Text(
          maxScore ?? "0",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2.copyWith(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8),
        ),
      ],
    );
  }

  Container _buildDescription(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 30),
      child: Text(
        "Kamu telah menjawab kuis dengan nilai yang sangat baik.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5),
      ),
    );
  }

  Container _buildSubtitle(BuildContext context) {
    return Container(
      child: Text(
        "Selamat!!!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.8),
      ),
    );
  }

  Container _buildTitle(BuildContext context) {
    return Container(
      child: Text(
        "Hasil Kuis",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.8),
      ),
    );
  }
}
