import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/constants.dart' as Constants;

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final String inputName;
  final String? helperText;
  final TextEditingController controller;
  final TextInputAction actionKeyboard;
  // final FocusNode? focusNode;
  final TextInputType actionType;
  final Function onSubmitField;
  final bool isValidate;
  final Color fillColor;
  final bool isBorder;
  final EdgeInsets contentPadding;
  final Widget? prefixIcon;
  final Function onChange;
  final List<TextInputFormatter>? inputFormatter;
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.inputName,
    required this.controller,
    required this.onSubmitField,
    required this.onChange,
    // this.focusNode,
    this.helperText,
    this.obscureText = false,
    this.actionKeyboard = TextInputAction.next,
    this.actionType = TextInputType.text,
    this.isValidate = true,
    this.fillColor = Colors.white,
    this.isBorder = false,
    this.prefixIcon,
    this.inputFormatter,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscureText,
      controller: widget.controller,
      // focusNode: widget.focusNode,
      textInputAction: widget.actionKeyboard,
      keyboardType: widget.actionType,
      autovalidateMode: widget.isValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: (value) {
        // if (_animatedPassword) return null;
        if (value!.isEmpty) {
          return 'Anda belum mengisi ${widget.inputName}';
        }
        // setState(() {});
        return null;
      },
      onChanged: (value) {
        widget.onChange(value);
      },
      onFieldSubmitted: (value) {
        return widget.onSubmitField();
      },
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Constants.black01,
          ),
      decoration: InputDecoration(
        isDense: true,
        helperText: widget.helperText,
        helperMaxLines: 2,
        helperStyle: Theme.of(context).textTheme.caption!.copyWith(
              color: Constants.black04,
            ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Constants.grey01,
            ),
        contentPadding: widget.contentPadding,
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: widget.prefixIcon,
        border: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Constants.black01,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.black01,
                ),
              ),
        focusedBorder: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
      ),
    );
  }
}
