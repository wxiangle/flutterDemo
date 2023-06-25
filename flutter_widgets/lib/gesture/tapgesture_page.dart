import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapGesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TagGestureState();
  }
}

class TagGestureState extends State<TapGesturePage> {
  late TapAndPanGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapAndPanGestureRecognizer();
  }

  @override
  void dispose() {
    super.dispose();
    _recognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: Center(
          child: Text.rich(TextSpan(children: [
        TextSpan(text: "link"),
        TextSpan(
            text: "www.wxiangle.top",
            style: TextStyle(color: Colors.blue),
            recognizer: _recognizer
              ..onTapUp = (details) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    body: Center(
                      child: Text("我被打开了"),
                    ),
                  );
                }));
              }),
      ]))),
    );
  }
}
