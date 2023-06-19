import 'package:flutter_widgets/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/animation_utils.dart';

///组件动画
class BuilderAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuilderAnimState();
  }
}

class BuilderAnimState extends State<BuilderAnim>
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
    return Container(color: Colors.cyan,child: ScaleAnim(animation: _animation, child: Image.network(MyImages.image_ke_lala)));
  }
}
