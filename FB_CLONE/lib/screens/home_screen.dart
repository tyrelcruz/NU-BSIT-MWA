import 'package:flutter/material.dart';
import 'package:myapp/screens/notification_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final String? username; // ENHANCEMENT 3
  const HomeScreen({super.key, this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  late List<String> _titles; // ENHANCEMENT 3
  final List<String> _fontFamilies = ['Klavika', 'Arial', 'Arial'];
  final List<FontWeight> _fontWeights = [
    FontWeight.normal,
    FontWeight.bold,
    FontWeight.bold
  ];
  final List<Color> _titleColors = [
    FB_PRIMARY,
    FB_TEXT_COLOR_BLACK,
    FB_PRIMARY
  ];

  @override
  void initState() {
    super.initState();// ENHANCEMENT 3
    _titles = ['Macemook', 'Notifications', widget.username ?? 'Profile'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: CustomFont(
          text: _titles[_selectedIndex],
          fontSize: ScreenUtil().setSp(25),
          color: _titleColors[_selectedIndex],
          fontFamily: _fontFamilies[_selectedIndex],
          fontWeight: _fontWeights[_selectedIndex],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: [
          const NewsFeedScreen(),
          const NotificationScreen(),
          ProfileScreen(username: widget.username), // Pass username to ProfileScreen
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}