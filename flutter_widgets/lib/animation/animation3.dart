import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation3Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Animation3PageState();
  }
}

class _Animation3PageState extends State<Animation3Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          _controller.forward();
          // _controller.stop();
          // _controller.reset();
          // _controller.repeat();
          // _controller.reverse();
        },
      ),
      appBar: AppBar(
        title: Text("this is a animation3 title "),
      ),
      body: Center(
        child: Column(
          children: [
            FadeTransition(
              opacity: _controller,
              child: FlutterLogo(
                size: 70,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: Text("forward")),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop();
                    },
                    child: Text("stop")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    child: Text("reset")),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat();
                    },
                    child: Text("repeat")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse();
                    },
                    child: Text("reverse")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Animation3Page(),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}
