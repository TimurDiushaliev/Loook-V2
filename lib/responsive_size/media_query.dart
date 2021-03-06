import 'package:flutter/material.dart';

class MediaQuerySize {
  static width(context) {
    final _width = MediaQuery.of(context).size.width;
    return _width;
  }

  static height(context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return _height;
  }
}
