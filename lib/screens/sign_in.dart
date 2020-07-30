import 'dart:async';

import 'package:bridcodes_task/widgets/buildButton.dart';
import 'package:bridcodes_task/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
            onPress: () {},
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
              inputBox(hintText: 'Enter your Password', controller: _passwordController, isPassword: true, context: context)
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
              inputBox(hintText: 'Enter your Username or Email', controller: _emailController, context: context)
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          )
        ],
      ),
    );
  }
}
