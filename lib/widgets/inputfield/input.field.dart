import 'package:kunime_app/common/styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool obscureText;
  final String initialValue;
  final int maxLines;
  final int maxLength;
  final String errorText;
  final BorderRadius borderRadius;
  final TextInputType keyboardType;
  final Function validator;
  final ValueChanged<String> onChanged;
  final Function(String value) onSubmit;
  final bool disabled;

  const InputField({
    Key key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.obscureText = false,
    this.initialValue,
    this.maxLines = 1,
    this.borderRadius,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.errorText,
    this.maxLength,
    this.onSubmit,
    this.disabled = false,
  }) : super(key: key);

  String get getHintText => this.hintText != null ? this.hintText : 'text';

  BorderRadius get border {
    if (this.borderRadius != null) {
      return this.borderRadius;
    }
    return BorderRadius.circular(10);
  }

  TextInputType get inputType {
    if (this.keyboardType != null) {
      return this.keyboardType;
    }
    return TextInputType.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      onChanged: this.onChanged,
      onFieldSubmitted: onSubmit,
      maxLines: this.maxLines,
      maxLength: this.maxLength,
      readOnly: disabled,
      validator: this.validator,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(color: textColor, fontWeight: FontWeight.w500),
      keyboardType: this.inputType,
      decoration: _decorationInput(context),
    );
  }

  InputDecoration _decorationInput(BuildContext context) {
    return InputDecoration(
      hintText: getHintText,
      isDense: true,
      hintStyle: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(color: textColor.withOpacity(0.5)),
      errorMaxLines: 3,
      errorText: this.errorText,
      errorStyle:
          Theme.of(context).textTheme.subtitle2.copyWith(color: redColor),
      counterText: "",
      contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      enabledBorder: _defaultBorder(),
      focusedBorder: _activeBorder(),
      errorBorder: _errorBorder(),
      focusedErrorBorder: _errorBorder(),
    );
  }

  OutlineInputBorder _activeBorder() {
    return OutlineInputBorder(
      borderRadius: this.border,
      borderSide: BorderSide(
        color: primaryColor,
        width: 1.5,
      ),
      gapPadding: 10.0,
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: this.border,
      borderSide: BorderSide(
        color: redColor,
        width: 1.5,
      ),
      gapPadding: 10.0,
    );
  }

  OutlineInputBorder _defaultBorder() {
    return OutlineInputBorder(
      borderRadius: this.border,
      borderSide: BorderSide(
        color: borderColor,
        width: 1.5,
      ),
      gapPadding: 10.0,
    );
  }
}
