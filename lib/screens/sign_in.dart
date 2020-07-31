import 'dart:async';

import 'package:bridcodes_task/screens/dashboard.dart';
import 'package:bridcodes_task/screens/registration_page.dart';
import 'package:bridcodes_task/widgets/buildButton.dart';
import 'package:bridcodes_task/widgets/dialog.dart';
import 'package:bridcodes_task/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:regexed_validator/regexed_validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      Navigator.push(
        context,
        PageTransition(child: Dashboard(), type: PageTransitionType.fade),
      );
      return user.uid;
    } catch (e) {
      print(e);
      popDialog(title: 'Error', context: context, content: 'Some error try again!');
    }
    setState(() {
      _isLoading = false;
    });
  }

  ScrollController _scrollController = new ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      _scrollController.animateTo(50.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.of(context).size.width * 0.12,
        ),
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          reverse: true,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO Route to Navigate to Sign up Page
                    Navigator.push(
                      context,
                      PageTransition(child: RegistrationPage(), type: PageTransitionType.fade),
                    );
                  },
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            buildButton(
              backgroundColor: Colors.black,
              onPress: () async {
                setState(() {
                  _isLoading = true;
                  !validator.email(_emailController.text) || _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                  _passwordController.text.isEmpty || _passwordController.text.length < 6 ? _validatePassword = true : _validatePassword = false;
                });
                if (!_validatePassword && !_validateEmail) {
                  await signIn(_emailController.text, _passwordController.text);
                }
              },
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                inputBox(
                    hintText: 'Enter your Password',
                    controller: _passwordController,
                    isPassword: true,
                    context: context,
                    validate: _validatePassword,
                    errorText: 'Please enter a valid more than 6 digit password!')
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username or Email',
                  style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                inputBox(
                    hintText: 'Enter your Username or Email',
                    controller: _emailController,
                    context: context,
                    validate: _validateEmail,
                    errorText: 'Please enter a valid email ID',
                    textInputType: TextInputType.emailAddress)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Hello there, sign in to continue',
              style: TextStyle(color: Colors.grey, fontSize: 19),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
