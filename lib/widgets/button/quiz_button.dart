import 'package:flutter/material.dart';
import 'package:kunime_app/common/enum.dart';
import 'package:kunime_app/common/styles.dart';

class QuizButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final AnswerType type;
  final bool disabled;

  const QuizButton({
    Key key,
    this.text,
    this.onPressed,
    this.type = AnswerType.None,
    this.disabled = false,
  }) : super(key: key);

  Color get _background {
    if (type == AnswerType.Correct) {
      return primaryColor;
    } else if (type == AnswerType.Wrong) {
      return redColor;
    } else {
      return secondaryColor;
    }
  }

  Color get _backgroundHover {
    if (type == AnswerType.None) {
      return primaryColor.withOpacity(0.4);
    } else {
      return secondaryColor.withOpacity(0.4);
    }
  }

  Color get _textColor {
    if (type == AnswerType.None) {
      return textColor;
    } else {
      return secondaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_background),
              overlayColor: MaterialStateProperty.all(_backgroundHover),
              foregroundColor: MaterialStateProperty.all(_backgroundHover),
              shadowColor: MaterialStateProperty.all(_backgroundHover),
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              enableFeedback: true,
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Text(
              text ?? "Text Button",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: _textColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
            ),
          ),
          if (type == AnswerType.Correct) ...{
            Positioned(
              right: 10,
              top: 12.5,
              child: Image.asset(
                "assets/icons/icon_check.png",
                width: 25,
                height: 25,
              ),
            ),
          } else if (type == AnswerType.Wrong) ...{
            Positioned(
              right: 10,
              top: 12.5,
              child: Image.asset(
                "assets/icons/icon_close.png",
                width: 25,
                height: 25,
              ),
            ),
          }
        ],
      ),
    );
  }
}
