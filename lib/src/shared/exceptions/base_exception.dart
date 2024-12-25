import 'package:flutter/material.dart';

abstract class BaseException implements Exception {
  BaseException({required this.message}) {
    FlutterError.presentError(FlutterErrorDetails(exception: message));
  }

  String message;
}
