import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final double dialogRadius;
  final EdgeInsets contentPadding;
  final Widget contents;
  CustomDialog({
    Key? key,
    required this.contents,
    this.dialogRadius = 14.0,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      insetAnimationDuration: Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogRadius),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 480,
        ),
        padding: contentPadding,
        child: SingleChildScrollView(
          child: contents,
        ),
      ),
    );
  }
}
