import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

///组件动画
class WidgetAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetAnimState();
  }
}

class AnimWidget extends AnimatedWidget {
  const AnimWidget({super.key, required Animation animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation;
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: animation.value,
        height: animation.value,
        child: Image.network(MyImages.image_ke_lala),
      ),
    );
  }
}

class WidgetAnimState extends State<WidgetAnim>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _tween = Tween(begin: 0, end: 400);
    _animation = _tween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimWidget(animation: _animation);
  }
}
