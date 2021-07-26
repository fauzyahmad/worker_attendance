import 'package:flutter/material.dart';
import 'package:worker_attendace/ui/view/login_screen.dart';
import 'package:worker_attendace/ui/view/signup_screen.dart';
import 'package:worker_attendace/ui/widget/custom_button.dart';
import '../../core/utils/constants.dart' as Constants;

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: Constants.paddingContent,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang di Aplikasi Absensi Pegawai',
                style: theme.textTheme.headline3!.copyWith(
                  color: Constants.black01,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                texts: [
                  Text(
                    'Login',
                    style: theme.textTheme.button!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                fillColor: theme.primaryColor,
                borderColor: theme.primaryColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                texts: [
                  Text(
                    'Sign Up',
                    style: theme.textTheme.button!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                fillColor: Colors.white,
                borderColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
