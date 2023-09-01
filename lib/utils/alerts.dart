import 'package:flutter/material.dart';

void showAlert(Size size, Color color, BuildContext context, String msg) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: Center(
          child: Text(msg),
        ),
      ),
    ),
  );
}
