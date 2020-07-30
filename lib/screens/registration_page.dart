import 'package:bridcodes_task/screens/otp_verification.dart';
import 'package:bridcodes_task/widgets/buildButton.dart';
import 'package:bridcodes_task/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int _radioValue;
  bool _isActive = false;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignUp(email, password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);
    print(user.displayName);
    print(user.email);
    return user;
  }

  Future<bool> _loginUser(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if (user != null) {
            print('working');
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          Navigator.push(
            context,
            PageTransition(
                child: OTPVerification(
                  verificationID: verificationId,
                ),
                type: PageTransitionType.fade),
          );
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08, left: MediaQuery.of(context).size.width * 0.12),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.14, horizontal: MediaQuery.of(context).size.width * 0.12),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: _isActive ? EdgeInsets.zero : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                        Text(
                          'Hello there, sign in to continue',
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            inputBox(
                                hintText: 'Enter your Business Name',
                                controller: _nameController,
                                isPassword: false,
                                context: context,
                                onTap: () {
                                  setState(() {
                                    _isActive = true;
                                  });
                                })
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            inputBox(hintText: 'Enter your Business Email', controller: _emailController, isPassword: false, context: context)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Number',
                              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            inputBox(
                                maxLength: true,
                                maxValue: 10,
                                hintText: 'XXXXXXXXXX',
                                controller: _phoneNumberController,
                                isPassword: false,
                                context: context,
                                onChanged: (value) async {
                                  if (value.length == 10) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await _loginUser("+91" + _phoneNumberController.text, context);
                                  }
                                })
                          ],
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.black,
                                toggleable: true,
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (int value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                  print(_radioValue);
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'By creating an account you agree to our',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                                Text(
                                  'terms and conditions',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildButton(
                          onPress: () async {
                            handleSignUp(_emailController.text, _passwordController.text).then((value) {
                              Navigator.push(
                                context,
                                PageTransition(child: OTPVerification(), type: PageTransitionType.fade),
                              );
                            });
                          },
                          backgroundColor: Colors.black,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO Route to Navigate to Sign in Page
                              },
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.12,
                                child: Center(
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
