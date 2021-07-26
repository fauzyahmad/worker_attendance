import 'package:flutter/material.dart';
import '../../core/utils/constants.dart' as Constants;

class DetailCheckin extends StatelessWidget {
  final String name;
  final String date;
  final String workingTime;
  final String checkingIn;
  final String checkingOut;
  DetailCheckin({
    Key? key,
    required this.name,
    required this.date,
    required this.workingTime,
    required this.checkingIn,
    required this.checkingOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.headline6!.copyWith(
            color: Constants.black01,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tanggal: $date',
              style: theme.textTheme.caption!.copyWith(
                color: Constants.black03,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.circle,
              size: 5,
              color: Constants.grey01,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Durasi: $workingTime',
              style: theme.textTheme.caption!.copyWith(
                color: Constants.black03,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Check In: $checkingIn',
              style: theme.textTheme.caption!.copyWith(
                color: Constants.black03,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.circle,
              size: 5,
              color: Constants.grey01,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Check In: $checkingOut',
              style: theme.textTheme.caption!.copyWith(
                color: Constants.black03,
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
