import 'package:flutter/material.dart';

class MyGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my grid page'),
      ),
      body: GridView.count(
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   mainAxisSpacing: 2,
        //     crossAxisSpacing: 2,
        //     crossAxisCount: 2, childAspectRatio: 2.0),
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class MyGridPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my grid page2'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Container(
                    color: Colors.green,
                  )
                : Container(
                    color: Colors.red,
                  );
          }),
    );
  }
}
