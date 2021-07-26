import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final List<Widget> texts;
  final Function onPressed;
  final Color fillColor;
  final Color borderColor;
  final double opacity;
  final double borderRadius;
  CustomButton({
    Key? key,
    required this.texts,
    required this.onPressed,
    required this.fillColor,
    required this.borderColor,
    this.borderRadius = 6.0,
    this.opacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor.withOpacity(opacity),
        ),
      ),
      elevation: 0,
      fillColor: fillColor.withOpacity(opacity),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: texts.map((textWidget) => textWidget).toList()),
      ),
    );
  }
}
