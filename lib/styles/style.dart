import 'package:flutter/material.dart';

class Style {
  static final searchInput = InputDecoration(
      filled: true,
      icon: Icon(Icons.search),
      labelText: 'Поиск...',
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))));
}
