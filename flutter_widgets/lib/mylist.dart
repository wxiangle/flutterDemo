import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my list page"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemExtent: 20,
          itemBuilder: (BuildContext context, int index) {
            return index % 2 == 0
                ? Container(
                    height: 150,
                    color: Colors.grey,
                  )
                : Container(
                    height: 150,
                    color: Colors.blue,
                  );
          }),
    );
  }
}

class MyListPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my page 2"),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return index % 2 == 0
              ? Container(
                  height: 150,
                  color: Colors.grey,
                )
              : Container(
                  height: 150,
                  color: Colors.blue,
                );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 2,
            color: Colors.black,
            thickness: 2.0,
          );
        },
      ),
    );
  }
}

class MyListPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListPage3State();
  }
}

class _MyListPage3State extends State<MyListPage3> {
  List<String> _words = <String>[''];

  void _loadWords() {
    print("_words size = ${_words.length}");
    Future.delayed(Duration(milliseconds: 1000)).then((value) =>
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList()));
  }

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my page 3"),
      ),
      body: ListView.separated(

        itemBuilder: (BuildContext context, int index) {
          if (index == _words.length - 1) {
            if (_words.length - 1 < 100) {
              _loadWords();
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(20),
                child: Text("没有更多了"),
              );
            }
          } else {
            return ListTile(
              title: Text(_words[index]),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 2,
            color: Colors.black,
            thickness: 2.0,
          );
        }, itemCount: 200,
      ),
    );
  }
}
