import 'package:logger/logger.dart';

class Log {
  static final _logger = Logger(printer: SimplePrinter(), level: Level.debug);

  static void f(dynamic message, {StackTrace? stackTrace}) {
    _logger.f(message, stackTrace: stackTrace);
  }

  static void e(dynamic message, {StackTrace? stackTrace}) {
    _logger.e(message, stackTrace: stackTrace);
  }

  static void w(dynamic message, {StackTrace? stackTrace}) {
    _logger.w(message, stackTrace: stackTrace);
  }

  static void i(dynamic message, {StackTrace? stackTrace}) {
    _logger.i(message, stackTrace: stackTrace);
  }

  static void d(dynamic message, {StackTrace? stackTrace}) {
    _logger.d(message, stackTrace: stackTrace);
  }

  static void t(dynamic message, {StackTrace? stackTrace}) {
    _logger.t(message, stackTrace: stackTrace);
  }
}
