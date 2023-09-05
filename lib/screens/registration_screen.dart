import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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

  void handleRegister() async {
    showLoading();
    try {
      final navigator = Navigator.of(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
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
                onChanged: (value) { email = value;},
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 8.0,
              ),
              RoundedTextField(
                hint: 'Enter your password',
                onChanged: (value) { password = value; },
                obscureText: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                label: 'Register', 
                color: Colors.blueAccent, 
                onPressed: handleRegister
              ),
            ],
          ),
        ),
      ),
    );
  }
}