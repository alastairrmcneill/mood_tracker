import 'package:flutter/material.dart';

// 1 button Dialog
showAlertDialog({required BuildContext context, required String title, required String message}) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Done"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
