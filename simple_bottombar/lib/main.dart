import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'export_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNS UI',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MainUI(),
    );
  }
}

class MainUI extends StatefulWidget {
  @override
  _MainUI createState() => _MainUI();
}

class _MainUI extends State<MainUI> {
  int _selectedIndex = 0;

  List _widgetOptions = [
    Text(
      'Home',
      style: TextStyle(fontSize: 30),
    ),
    // Text(
    //   'Search',
    //   style: TextStyle(fontSize: 30),
    // ),
    ExploreScreen(),
    Text(
      'Add',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Likes',
      style: TextStyle(fontSize: 30),
    ),
    // Text(
    //   'Profile',
    //   style: TextStyle(fontSize: 30),
    // ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // BottomNavigationBar Widget
          type: BottomNavigationBarType.fixed,

          // BottomNavigationBar Colors
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),

          // selected Items
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Likes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
    );
  }
}
