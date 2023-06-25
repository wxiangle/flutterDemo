import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GesturePageState();
  }
}

class GesturePageState extends State<GesturePage> {
  double _top = 10;
  double _left = 10;

  double _width = 100;
  double _height = 200;

  double _scale = 1.0;
  late double _previousScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page ')),
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onScaleStart: (details) {
                _previousScale = _scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                });
              },

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200 ,
                child: Center(
                  child: Transform.scale(
                    scale: _scale,
                    child: Image.network(
                      MyImages.image_ke_lala,
                      width: _width * _scale,
                      height: _height * _scale,
                    ),
                  ),
                ),
              ),

              // onPanUpdate: (details) {
              //   setState(() {
              //     _top += details.delta.dy;
              //     _left += details.delta.dx;
              //   });
              // },

              // onVerticalDragUpdate: (detail) => {
              //   setState(() {
              //     _top += detail.delta.dy;
              //   })
              // },
            ),
          )
        ],
      ),
    );
  }
}
