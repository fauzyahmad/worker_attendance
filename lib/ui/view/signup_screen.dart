import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worker_attendace/core/view_model/auth_view_model.dart';
import 'package:worker_attendace/ui/widget/custom_button.dart';
import 'package:worker_attendace/ui/widget/custom_textfield.dart';
import 'package:worker_attendace/ui/widget/universal_appbar.dart';
import '../../core/utils/constants.dart' as Constants;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _name.removeListener(onChangeControl);
    _name.dispose();
    _email.removeListener(onChangeControl);
    _email.dispose();
    _password.removeListener(onChangeControl);
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _name.addListener(onChangeControl);
    _email.addListener(onChangeControl);
    _password.addListener(onChangeControl);
    super.initState();
  }

  void onChangeControl() {
    setState(() {});
  }

  void _submitSignUp() async {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<AuthViewModel>(context, listen: false)
          .signUp(_email.text, _password.text, _name.text);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      inspect(e);
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: UniversalAppbar(
        title: 'Sign Up Account',
        backgroundColor: Colors.white,
        textColor: Constants.black02,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          reverse: true, // this is new
          physics: BouncingScrollPhysics(),
          padding: Constants.paddingContent,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  hintText: 'Masukkan Nama Lengkap',
                  inputName: 'name',
                  controller: _name,
                  actionKeyboard: TextInputAction.next,
                  actionType: TextInputType.text,
                  isBorder: true,
                  isValidate: true,
                  onSubmitField: () => print(''),
                  onChange: () => print(''),
                  prefixIcon: null,
                  contentPadding: EdgeInsets.all(15),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Masukkan E-mail',
                  inputName: 'email',
                  controller: _email,
                  actionKeyboard: TextInputAction.next,
                  actionType: TextInputType.emailAddress,
                  isBorder: true,
                  isValidate: true,
                  onSubmitField: () => print(''),
                  onChange: () => print(''),
                  prefixIcon: null,
                  contentPadding: EdgeInsets.all(15),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Masukkan Password',
                  inputName: 'password',
                  controller: _password,
                  obscureText: true,
                  actionKeyboard: TextInputAction.go,
                  actionType: TextInputType.text,
                  isBorder: true,
                  // isValidate: true,
                  onSubmitField: () => _submitSignUp(),
                  onChange: () => print(''),
                  prefixIcon: null,
                  contentPadding: EdgeInsets.all(15),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  texts: _isLoading
                      ? [
                          SizedBox(
                            width: 15.0,
                            height: 15.0,
                            child: CircularProgressIndicator(
                              backgroundColor: theme.primaryColor,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              // value: null,
                              strokeWidth: 2.0,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Signing Up...',
                            style: theme.textTheme.button!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            'Sign Up',
                            style: theme.textTheme.button!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                  onPressed: () {
                    // Navigator.pop(context);
                    _submitSignUp();
                  },
                  fillColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
