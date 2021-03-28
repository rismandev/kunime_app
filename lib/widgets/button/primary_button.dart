import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
      child: Text(
        text ?? "Button",
        style: Theme.of(context).textTheme.button.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
