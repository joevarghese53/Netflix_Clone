import 'package:flutter/material.dart';

ValueNotifier<int> bottomnavindexnotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bottomnavindexnotifier,
      builder: (context, value, child) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: value,
          onTap: (newvalue) {
            bottomnavindexnotifier.value = newvalue;
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: 'New & Hot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: 'Fast Laughs',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Watchlist',
            ),
          ],
        );
      },
    );
  }
}
