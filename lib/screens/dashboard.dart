import 'package:bridcodes_task/screens/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

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
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 60, right: 60, top: 10),
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(18),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.free_breakfast,
                    size: 25,
                    color: Color(0xFF646464),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF646464),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.mail,
                    size: 25,
                    color: Color(0xFF646464),
                  ),
                  Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF646464),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.payment,
                    size: 25,
                    color: Color(0xFF646464),
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF646464),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(child: LogOut(), type: PageTransitionType.fade),
                      );
                    },
                    child: Icon(
                      Icons.person,
                      size: 25,
                      color: Color(0xFF646464),
                    ),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF646464),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Container(
            child: ListView(
              padding: EdgeInsets.only(left: 40, top: MediaQuery.of(context).size.height * 0.1),
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Good Morning,',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFBDBDBD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Text(
                  'Varun',
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 60,
                    top: 25,
                    bottom: 25,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 43,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                      ),
                      Icon(
                        Icons.keyboard_voice,
                        color: Colors.black,
                      )
                    ]),
                  ),
                ),
                Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 5, color: Colors.white),
                                        top: BorderSide(width: 5, color: Colors.white),
                                        left: BorderSide(width: 5, color: Colors.white),
                                        right: BorderSide(width: 5, color: Colors.white),
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      '100%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'App Design',
                                style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC6C6C6),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBDBDBD),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC6C6C6),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBDBDBD),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 5, color: Colors.white),
                                        top: BorderSide(width: 5, color: Colors.white),
                                        left: BorderSide(width: 5, color: Colors.white),
                                        right: BorderSide(width: 5, color: Colors.white),
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      '100%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Social Media',
                                style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC6C6C6),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBDBDBD),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC6C6C6),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBDBDBD),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 5, color: Colors.white),
                                        top: BorderSide(width: 5, color: Colors.white),
                                        left: BorderSide(width: 5, color: Colors.white),
                                        right: BorderSide(width: 5, color: Colors.white),
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      '100%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'App Design',
                                style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC6C6C6),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBDBDBD),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC6C6C6),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBDBDBD),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 5, color: Colors.white),
                                        top: BorderSide(width: 5, color: Colors.white),
                                        left: BorderSide(width: 5, color: Colors.white),
                                        right: BorderSide(width: 5, color: Colors.white),
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      '100%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'App Design',
                                style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC6C6C6),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBDBDBD),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC6C6C6),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBDBDBD),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Request Service',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Support',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Appointment',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'News',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultTabController(
                  length: 3,
                  child: Container(
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Week',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Month',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Republic Day Creative',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '10:20 am',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Social Media Creative',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Republic Day Creative',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '10:20 am',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Social Media Creative',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
