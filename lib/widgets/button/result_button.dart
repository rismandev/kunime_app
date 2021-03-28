import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

class ResultButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function onPressed;
  final bool isPrimary;

  const ResultButton({
    Key key,
    this.text,
    this.icon,
    this.onPressed,
    this.isPrimary = false,
  }) : super(key: key);

  Color get _background {
    if (this.isPrimary) {
      return greenColor;
    } else {
      return secondaryColor;
    }
  }

  Color get _textColor {
    if (this.isPrimary) {
      return secondaryColor;
    } else {
      return textColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed ?? () {},
        child: Row(
          children: [
            Image.asset(
              icon ?? "assets/icons/icon_faq.png",
              width: 25,
              height: 25,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text ?? "Text Button",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: _textColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
