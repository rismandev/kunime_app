import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

class DisableButton extends StatelessWidget {
  final String text;

  const DisableButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(borderColor),
        elevation: MaterialStateProperty.all(0),
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
            color: textColor, fontWeight: FontWeight.w600, letterSpacing: 1.5),
      ),
      onPressed: null,
    );
  }
}
