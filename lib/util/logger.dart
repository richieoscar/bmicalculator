import 'package:logger/logger.dart';

class AppLogger {
  static void logInfo(String message) {
    Logger logger = Logger();
    logger.i(message);
  }
}
