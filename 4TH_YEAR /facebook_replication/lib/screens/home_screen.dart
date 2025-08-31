import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'article_screen.dart';
import 'settings_screen.dart';
import '../widgets/custom_text.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, this.username = ''});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeProvider>();
    final isDark = themeModel.isDark;

    return Scaffold(
      backgroundColor: isDark
          ? Colors.grey[900]
          : Colors.white, // White background for light mode
      appBar: AppBar(
        backgroundColor: isDark
            ? Colors.grey[900]
            : Colors.white, // White app bar for light mode
        elevation: 0,
        title: CustomText(
          text: _selectedIndex == 0 ? 'Articles' : 'Home',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black87),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: isDark ? Colors.white : Colors.black87,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [ArticleScreen(), Placeholder(), Placeholder()],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark
            ? Colors.grey[800]
            : Colors.white, // Theme-aware navigation bar
        selectedItemColor: Colors.blue[600], // Blue for selected items
        unselectedItemColor: isDark
            ? Colors.grey[400]
            : Colors.grey[600], // Theme-aware unselected items
        //selected item
        showSelectedLabels: false,
        //unselected item
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
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
