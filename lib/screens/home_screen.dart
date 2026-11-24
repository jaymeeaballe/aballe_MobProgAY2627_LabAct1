
import 'package:flutter/material.dart';
import '../constants.dart';
import 'newsfeed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: const Text(
          'facebook',
          style: TextStyle(
            fontFamily: 'Klavika',
            color: FB_PRIMARY,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: PageView(
        controller: pageController,
        children: const [
          NewsFeedScreen(),
          Center(
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: FB_PRIMARY,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });

          pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}