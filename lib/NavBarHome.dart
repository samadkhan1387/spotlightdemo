import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';
import 'Profile.dart';
import 'Progress.dart';

class NavbarhomePage extends StatefulWidget {
  @override
  _NavbarhomePageState createState() => _NavbarhomePageState();
}

class _NavbarhomePageState extends State<NavbarhomePage> {
  int _currentIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          // Home Page Content
          HomePage(),
          // Progress Page Content
          const ProgressPage(),
          // More Page Content
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:const Color(0xFFFBB168),
        selectedItemColor: const Color(0xFF4A4E65),
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }


  Widget _buildMorePage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('More Page Content', style: TextStyle(fontSize: 24)),
          // Add additional widgets or content here
        ],
      ),
    );
  }
}
