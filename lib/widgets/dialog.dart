import 'package:flutter/material.dart';

void popDialog({String title, BuildContext context, String content}) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Center(child: Text(title)),
        content: Text(content),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.black,
            child: new Text(
              'Close',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
