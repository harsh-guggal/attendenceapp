import 'package:elegant_notification/elegant_notification.dart';
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

void showSuccessNoti(BuildContext context, String title, String descritpion) {
  ElegantNotification.success(
    title: Text(title),
    description: Text(descritpion),
  ).show(context);
}

void showErrorNoti(BuildContext context, String title, String descritpion) {
  ElegantNotification.error(
    title: Text(title),
    description: Text(descritpion),
  ).show(context);
}

void showInfoNoti(BuildContext context, String title, String descritpion) {
  ElegantNotification.info(
    title: Text(title),
    description: Text(descritpion),
  ).show(context);
}
