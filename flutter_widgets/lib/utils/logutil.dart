import 'package:flutter_widgets/utils/log_storage.dart';
import 'package:flutter_widgets/utils/timeutils.dart';

enum Level { DEBUG, INFO, WARING, ERROR }

bool get isDebugMode {
  bool debugMode = true;
  assert(debugMode == true);
  return debugMode;
}

class LogUtil {
  static Level logLevel = Level.DEBUG;

  static final LogsStorage storage = LogsStorage.instance;

  static d({required String? content, String? tag}) {
    _log2File(Level.DEBUG, tag ?? "DEBUG", content);
  }

  static i({required String? content, String? tag}) {
    _log2File(Level.INFO, tag ?? "INFO", content);
  }

  static w({required String? content, String? tag}) {
    _log2File(Level.WARING, tag ?? "WARING", content);
  }

  static e({required String? content, String? tag}) {
    _log2File(Level.ERROR, tag ?? "ERROR", content);
  }

  static void _log2File(Level level, String? tag, String? content) {
    String log = _formatLog(level, tag, content);
    if (isDebugMode) {
      print(log);
    }

    if (level.index >= logLevel.index) {
      storage.writeLogs2File(log);
    }
  }

  static String _formatLog(Level level, String? tag, String? content) {
    String log = level.toString();
    log += " ${TimeUtil.getCurrentFullTime()} ";
    log += "$tag ";
    log += "$content \n";
    return log;
  }
}
