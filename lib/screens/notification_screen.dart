import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/notification.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            notif.Notification(
              name: "Pokwang",
              post: "Nagpost si pokwang warafak!",
              description: "Bago na tlga.",
              profileImageUrl:
                  "https://m.media-amazon.com/images/M/MV5BYzdmYjlmMmUtMmFhOS00NzQ3LTk0YzEtYTMyMjJiMjM5MTVkXkEyXkFqcGc@._V1_.jpg",
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQegl5kPHJOAyVJRh9Mv3y_EbPJSrH7BEvEXQ&s", // Main Post Image
              date: "2025-01-23",
            ),
            notif.Notification(
              name: 'User namba 2',
              post: 'wat is dis',
              description: 'testing',
              date: '2025-01-22',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
