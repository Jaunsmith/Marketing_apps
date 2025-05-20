import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:market_app/screens/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _indexSelected = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Text('My Next page 2'),
    Text('My Next page 2'),
    Text('My Next page 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_indexSelected],
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        index: _indexSelected,
        backgroundColor: Colors.white,
        color: Colors.grey.shade300,
        buttonBackgroundColor: Colors.white,
        items: [
          Icon(Icons.home),
          Icon(Icons.local_shipping_outlined),
          Icon(Icons.notifications_none),
          Icon(Icons.person_2),
        ],
        onTap: (index) {
          setState(() {
            _indexSelected = index;
          });
        },
      ),
    );
  }
}
