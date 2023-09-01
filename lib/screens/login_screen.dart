import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flash_chat/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              hint: 'Enter your email',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              hint: 'Enter your password.',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              label: 'Log In', 
              color: Colors.lightBlueAccent,
              onPressed: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}