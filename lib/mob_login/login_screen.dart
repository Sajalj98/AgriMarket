import 'package:flutter/material.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          decoration: InputDecoration(hintText: "Phone Number"),
        ),
        SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () {},
          child: Text("VERIFY"),
          style: TextButton.styleFrom(
            primary: Colors.blue,
            onSurface: Colors.red,
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
          ? getMobileFormWidget(context)
          : getOtpFormWidget(context),
    );
  }
}


