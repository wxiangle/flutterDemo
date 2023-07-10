import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/utils/log_storage.dart';
import 'package:flutter_widgets/utils/logutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SpTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SpTestPageState();
  }
}

class SpTestPageState extends State<SpTestPage> {
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

    LogUtil.d(content: uuidStr);
    uuidStr = await LogsStorage.instance.readLogs2File();
    print("uuid=$uuidStr");
    setState(() {});
  }
}
