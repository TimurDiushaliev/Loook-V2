import 'package:flutter/material.dart';

class Style {
  static final searchInput = InputDecoration(
      filled: true,
      labelText: 'Поиск товаров...',
      prefixIcon: Icon(Icons.search),
      fillColor: Colors.grey[350],
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))));
}
