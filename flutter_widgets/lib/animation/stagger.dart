import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///交织动画：制作一个复杂的动画序列或者重叠的动画
///基本要点：需要使用多个动画对象
///        1个AnimationController控制所有对象
///        每一个动画对象指定时间间隔
class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;

  final Animation<double> opacity, width, height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  StaggerAnimation({required this.animationController})
      : opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 0.1000, curve: Curves.linear))),
        width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.125, 0.250, curve: Curves.linear))),
        height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.250, 0.375, curve: Curves.linear))),
        padding = EdgeInsetsTween(
                begin: const EdgeInsets.only(bottom: 10),
                end: const EdgeInsets.only(bottom: 50))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.250, 0.375, curve: Curves.linear))),
        borderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(5), end: BorderRadius.circular(30))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.375, 0.500))),
        color = ColorTween(begin: Colors.blue, end: Colors.orange).animate(
            CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.500, 0.750))),
        super();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            padding: padding.value,
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: opacity.value,
              child: Container(
                width: width.value,
                height: height.value,
                decoration: BoxDecoration(
                    color: color.value,
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: borderRadius.value),
              ),
            ),
          );
        });
  }
}

class StaggerF extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerS();
  }
}

class StaggerS extends State<StaggerF> with TickerProviderStateMixin {
  late AnimationController _animationController;

  _play() async {
    await _animationController.forward().orCancel;
    await _animationController.reverse().orCancel;
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _play(),
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.orange,
            child: StaggerAnimation(animationController: _animationController),
          ),
        ),
      ),
    );
  }
}
