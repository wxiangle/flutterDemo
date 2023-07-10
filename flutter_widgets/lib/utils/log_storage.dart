import 'dart:io';
import 'package:flutter_widgets/utils/timeutils.dart';
import 'package:path_provider/path_provider.dart';

class LogsStorage {
  static final LogsStorage _singleton = LogsStorage._();

  LogsStorage._();

  static LogsStorage get instance {
    return _singleton;
  }

  File? _file;

  Future<String?> get _localPath async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }
    return directory?.path;
  }

  Future<File?> get _localFile async {
    final path = "${await _localPath ?? "path is null "}/flogs/";
    Directory(path).create().then((value) => print(value.path));

    var file = File("$path${TimeUtil.getDayTime()}.log");
    final isExist = await file.exists();
    if (isExist) {
      print("log file exists  ");
    } else {
      print("log file not exists  ");
    }

    _file = file;
    return file;
  }

  void writeLogs2File(String log) async {
    _file ??= await _localFile;
    _file?.writeAsStringSync(log, mode: FileMode.writeOnlyAppend);
  }

  Future<String?> readLogs2File() async {
    try {
      File? file = await _localFile;
      String? content = await file?.readAsString();
      return content;
    } catch (e) {
      return "read log error";
    }
  }
}
