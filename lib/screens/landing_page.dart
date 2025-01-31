import 'package:bridcodes_task/screens/registration_page.dart';
import 'package:bridcodes_task/screens/sign_in.dart';
import 'package:bridcodes_task/widgets/buildButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _showSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: MediaQuery.of(context).size.width * 0.12),
        child: Stack(
          children: [
            _showSignIn
                ? Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                : Container(),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: _showSignIn ? 70 : 10,
              right: MediaQuery.of(context).size.width * 0.48,
              top: _showSignIn ? MediaQuery.of(context).size.height * 0.14 : MediaQuery.of(context).size.height * 0.52,
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Manage your Business',
                  style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.normal),
                ),
                Text(
                  'seamlessly & intuitively',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                buildButton(
                  onPress: () {
                    //TODO Add Google Sign in Logic
                  },
                  backgroundColor: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            'assets/google.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Container(
                          child: Center(
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 33),
                  child: Container(
                    height: 43,
                    child: OutlineButton(
                      onPressed: () {
                        //TODO Add Navigation to Create an account
                        Navigator.push(
                          context,
                          PageTransition(child: RegistrationPage(), type: PageTransitionType.fade),
                        );
                      },
                      child: Text(
                        'Create an Account',
                        style: TextStyle(color: Colors.white),
                      ),
                      highlightedBorderColor: Colors.white,
                      highlightColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO Route to Navigate to Sign in Page
                        setState(() {
                          _showSignIn = true;
                        });
                        return showModalBottomSheet(
                          isScrollControlled: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) => SignIn(),
                        ).then((value) {
                          setState(() {
                            _showSignIn = false;
                          });
                        });
                      },
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 74,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
