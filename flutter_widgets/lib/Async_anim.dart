import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

///同步动画
class AsyncAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AsyncState();
  }
}

class AsyncState extends State<AsyncAnim> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Tween<double> _tween;
  late Tween<double> _opacity;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _tween = Tween(begin: 0, end: 400);
    _opacity = Tween(begin: 0, end: 0.5);

    // _animation = _tween.animate(CurvedAnimation(
    //     parent: _animationController, curve: Curves.fastOutSlowIn));
    _animation = _opacity.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Center();
      },
      child: Center(
        child: Opacity(
          opacity: _opacity.evaluate(_animation),
          child: SizedBox(
            width: _tween.evaluate(_animation),
            height: _tween.evaluate(_animation),
            child: Image.network(MyImages.image_ke_lala),
          ),
        ),
      ),
    );
  }
}
