import '../widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/detail_screen.dart';

class Notification extends StatefulWidget {
  const Notification({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.icon = const Icon(Icons.person),
    this.profileImageUrl = '',
    this.atProfile = false,
    required this.date,
    this.imageUrl = '',
  });

  final String name; // Post Title
  final String post; // Post Content
  final String description;
  final Icon icon;
  final String profileImageUrl;
  final String date;
  final String imageUrl;
  final bool atProfile;

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: InkWell(
        onTap: () {
          if (!widget.atProfile) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  userName: widget.name,
                  postContent: widget.description,
                  date: widget.date,
                  imageUrl: widget.imageUrl,
                  profileImageUrl: widget.profileImageUrl,
                ),
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                (widget.profileImageUrl == '')
                    ? widget.icon
                    : CircleAvatar(
                        radius: ScreenUtil().setSp(15),
                        backgroundImage: NetworkImage(widget.profileImageUrl),
                      ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: widget.name,
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    CustomFont(
                      text: 'Posted: ${widget.post}',
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.black,
                    ),
                    CustomFont(
                      text: widget.description,
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    CustomFont(
                      text: widget.date,
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
