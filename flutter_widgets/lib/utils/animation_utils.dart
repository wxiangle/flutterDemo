import 'package:flutter/cupertino.dart';

class ScaleAnim extends StatelessWidget {
  final Animation animation;
  final Widget child;

  const ScaleAnim({super.key, required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
