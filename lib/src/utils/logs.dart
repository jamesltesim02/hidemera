import 'package:logger/logger.dart';

/// 日志对象
Logger log = Logger(
  printer: PrettyPrinter(
    lineLength: 1000,
    noBoxingByDefault: true,
    methodCount: 0,
    errorMethodCount: 1000
  )
);