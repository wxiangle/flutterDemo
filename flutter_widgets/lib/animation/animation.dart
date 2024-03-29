import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

final animationApp = MaterialApp(
  title: 'Flutter Animation Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  home: BasicAnim(),
);

///基本动画
class BasicAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicState();
  }
}

class BasicState extends State<BasicAnim> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  late Tween<double> _tween;

  double _pacity = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _tween = Tween(begin: 0, end: 400);
    _animation = _tween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            AnimatedOpacity(
                opacity: _pacity,
                duration: const Duration(seconds: 2),
                child: const Text("this is a text")),
            SizedBox(
              width: _animation.value,
              height: _animation.value,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      _pacity = 1;
                    });
                  },
                  child: Image.network(MyImages.image_ke_lala,fit: BoxFit.fitHeight,)),
            ),
          ],
        ),
      ),
    );
  }
}
