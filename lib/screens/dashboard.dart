import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isLoading = false;
  String name;
  String email;

  Future getUser() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      name = user.displayName;
      email = user.email;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text(name),
              Text(email),
            ],
          ),
        ),
      ),
    ));
  }
}
