import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/images.dart';

///处理 手势歧义 使用 Listener
class GesturePage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GesturePageState3();
  }
}

class GesturePageState3 extends State<GesturePage3> {
  double _top = 10;
  double _left = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page ')),
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: Listener(
              onPointerUp: (events){
                print(events);
                print(events.localDelta.dy);
              },
              child: GestureDetector(
                child: Container(
                  child: Center(
                    child: ClipOval(
                      child: Image.network(
                        MyImages.image_ke_lala,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                onVerticalDragUpdate: (details) {
                  _top += details.delta.dy;
                  setState(() {

                  });
                },
                onHorizontalDragUpdate: (details) {
                  _left += details.delta.dx;
                  setState(() {

                  });
                },

                onTapUp: (details){
                  print("抬起手");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
