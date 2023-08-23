import 'dart:math';

import 'package:flutter/material.dart';
const _duration = Duration(milliseconds: 500);
double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

// double randomMargin() {
//   return Random().nextDouble() * 64;
// }

double randomMargin() {
  return 16.0 + Random().nextDouble() * 112.0;
}
Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {

    print("build update ");
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              width: 340,
              height: 340,
              duration: _duration,
              curve: Curves.easeIn,
              child: Container(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('change'),
              onPressed: () => {change()},
            ),
          ],
        ),
      ),
    );
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });

  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}