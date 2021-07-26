import 'package:flutter/material.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';
import 'package:worker_attendace/locator.dart';
import 'package:worker_attendace/ui/widget/custom_button.dart';

class DialogError {
  void showErrorDialog(String message) async {
    await showDialog(
      context: locator<NavigationService>().navigationKey.currentContext!,
      builder: (context) {
        return Dialog(
          elevation: 1,
          // insetPadding: EdgeInsets.all(20),
          insetAnimationDuration: Duration(milliseconds: 700),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Container(
            height: 255.0,
            width: 255.0,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            // decoration: BoxDecoration(

            // ),
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        texts: [
                          Text('Oke'),
                        ],
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        fillColor: Theme.of(context).primaryColor,
                        borderColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
