import 'package:flutter/material.dart';

abstract class BaseException implements Exception {
  BaseException({required String message}) {
    FlutterError.presentError(FlutterErrorDetails(exception: message));
  }
}
