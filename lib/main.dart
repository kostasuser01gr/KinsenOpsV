import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:kinsen_ops/app.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 80,
    colors: true,
    printEmojis: true,
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Centralized error handling
  FlutterError.onError = (details) {
    logger.e('Flutter Error: ${details.exception}', error: details.exception, stackTrace: details.stack);
  };

  runApp(
    const ProviderScope(
      child: KinsenOpsApp(),
    ),
  );
}
