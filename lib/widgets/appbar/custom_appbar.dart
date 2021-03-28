import 'package:flutter/material.dart';
import 'package:kunime_app/common/styles.dart';

class CustomAppBar extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  const CustomAppBar({
    Key key,
    this.padding,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.fromLTRB(10, 20, 25, 20),
      decoration: BoxDecoration(color: primaryColor),
      child: child,
    );
  }
}
