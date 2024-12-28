import 'package:flutter/material.dart';

void appSnackbar(BuildContext context, {String message = ''}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    ),
  );
}
