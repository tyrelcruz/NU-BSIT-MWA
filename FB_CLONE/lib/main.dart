import 'package:myapp/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() => runApp(const FacebookReplication());

class FacebookReplication extends StatelessWidget {
  const FacebookReplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(412, 715), // Adjust this as per your design specifications
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          color: Colors.white,
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          initialRoute: '/login',
          routes: {
            '/newsfeed': (context) => const NewsFeedScreen(),
            '/home': (context) {
              // Retrieve the username passed from the login screen
              final username = ModalRoute.of(context)!.settings.arguments as String?;
              return HomeScreen(username: username);
            },
            '/notification': (context) => const NotificationScreen(),
            '/login': (context) => const LogInScreen(),
            '/register': (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}