import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function onPressed;

  const SettingButton({
    Key key,
    this.text,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(
          color: primaryColor,
          style: BorderStyle.solid,
          width: 1,
        ),
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
                    color: textColor,
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
