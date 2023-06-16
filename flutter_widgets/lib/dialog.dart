import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogs {
  static AlertDialog getDefaultDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Dialog Title'),
      content: const Text('This is the content of the dialog.'),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Commit'),
        )
      ],
    );
  }
}
