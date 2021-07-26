import 'package:flutter/material.dart';

class UniversalAppbar extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color textColor;

  UniversalAppbar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
    this.actions,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
      elevation: 0,
      // centerTitle: true,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.headline4!.copyWith(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }
}
