
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

/// 页面之间 过渡动画
class RouteAnim extends StatelessWidget{
  const RouteAnim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'avatar',
          child: Image.network(
            MyImages.image_ke_lala,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}