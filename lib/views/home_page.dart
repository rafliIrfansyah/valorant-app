import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/views/agents_page.dart';
import 'package:valorant_app/views/bundles_page.dart';
import 'package:valorant_app/views/profile_page.dart';
import 'package:valorant_app/views/testimonies_page.dart';
import 'package:valorant_app/views/time_conversion.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottonNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Agents',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: 'Bundles',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_time),
      label: 'Time',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.comment),
      label: 'Testimonies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottonNavIndex = index;
    });
  }

  final List<Widget> _listWidget = [
    const AgentsPage(),
    const BundlesPage(),
    const TimeConversion(),
    const TestimoniesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottonNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        currentIndex: _bottonNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
