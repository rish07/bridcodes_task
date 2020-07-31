import 'package:bridcodes_task/screens/dashboard.dart';
import 'package:bridcodes_task/widgets/buildButton.dart';
import 'package:bridcodes_task/widgets/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPVerification extends StatefulWidget {
  final String verificationID;
  final String password;
  final String name;
  final String email;

  const OTPVerification({Key key, this.verificationID, this.password, this.name, this.email}) : super(key: key);
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  bool _isLoading = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Color(0xFFF1F1F1),
      border: Border.all(
        color: Color(0xFFF1F1F1),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        opacity: 0.5,
        inAsyncCall: _isLoading,
        child: Container(
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08, left: MediaQuery.of(context).size.width * 0.12),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.14, horizontal: MediaQuery.of(context).size.width * 0.12),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
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
                          'OTP Verification',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Have you received a six digit\nVerification Code?',
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: PinPut(
                                autofocus: true,
                                fieldsCount: 6,
                                onSubmit: (String pin) async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  final code = pin;
                                  AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: widget.verificationID, smsCode: code);
                                  try {
                                    AuthResult result = await _auth.signInWithCredential(credential);
                                    FirebaseUser user = result.user;
                                    UserUpdateInfo updateUser = UserUpdateInfo();
                                    updateUser.displayName = widget.name;
                                    await user.updatePassword(widget.password);
                                    await user.updateEmail(widget.email);
                                    await user.updateProfile(updateUser);
                                    if (user != null) {
                                      print('working');
                                      print(user.phoneNumber);
                                      Navigator.push(
                                        context,
                                        PageTransition(child: Dashboard(), type: PageTransitionType.fade),
                                      );
                                    } else {
                                      print("Error");
                                    }
                                  } catch (e) {
                                    print(e);
                                    Navigator.push(context, PageTransition(child: Dashboard(), type: PageTransitionType.fade));
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration: _pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(20)),
                                selectedFieldDecoration: _pinPutDecoration,
                                followingFieldDecoration: _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xFFF1F1F1),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                child: Text(
                                  'Resend Code',
                                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildButton(
                              onPress: () {},
                              backgroundColor: Colors.black,
                              child: Text(
                                'Verify',
                                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
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
