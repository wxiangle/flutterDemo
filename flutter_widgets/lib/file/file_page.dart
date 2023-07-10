import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FileTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileTestPageState();
  }
}

class FileTestPageState extends State<FileTestPage> {
  String? uuidStr = "init uuid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("持久化"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _initData, child: Text("$uuidStr"))
        ],
      ),
    );
  }

  Future _initData() async {
    print("uuid=start");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    uuidStr = sharedPreferences.getString("uuid");
    if (uuidStr == null || uuidStr == "init uuid") {
      uuidStr = const Uuid().v4();
      if (uuidStr != null) {
        sharedPreferences.setString("uuid", uuidStr!);
      } else {
        sharedPreferences.setString(
            "uuid", "${DateTime.now().millisecondsSinceEpoch}");
      }
    }
    print("uuid=$uuidStr");
    setState(() {});
  }
}
