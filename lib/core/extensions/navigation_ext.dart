import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {

  Future<T?> push<T>(Widget newPage) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

  Future pushReplacement(Widget newPage) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

}
