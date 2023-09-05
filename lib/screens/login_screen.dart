import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool loading = false;

  void showLoading() {
    setState(() {
      loading = true;
    });
  }

  void closeLoading() {
    setState(() {
      loading = false;
    });
  }

  void handleLogin() async {
    showLoading();
    try {
      final navigator = Navigator.of(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      navigator.pushNamed(ChatScreen.id);
    } catch(err) {
      print(err);
    } finally {
      closeLoading();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              RoundedTextField(
                hint: 'Enter your email',
                onChanged: (value) { email = value; },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 8.0,
              ),
              RoundedTextField(
                hint: 'Enter your password.',
                onChanged: (value) { password = value; },
                obscureText: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                label: 'Log In', 
                color: Colors.lightBlueAccent,
                onPressed: handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}