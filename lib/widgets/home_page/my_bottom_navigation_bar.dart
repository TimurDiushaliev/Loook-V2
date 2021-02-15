import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чат'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Профиль'),
      ],
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
