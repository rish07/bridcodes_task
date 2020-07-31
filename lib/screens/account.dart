import 'package:bridcodes_task/screens/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              PageTransition(child: LandingPage(), type: PageTransitionType.fade),
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}
