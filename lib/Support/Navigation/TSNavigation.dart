import 'package:flutter/material.dart';

class TSNavigation {
  static navigateTo({required Widget screen, required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static presentModal({required Widget screen, required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: true,
      ),
    );
  }

  static replaceModal({required Widget screen, required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: true,
      ),
    );
  }

  static pop({required BuildContext context, Object? result}) {
    Navigator.pop(context, result);
  }
}
