import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';

class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int initialLikes;
  final String imageUrl;
  final String profileImageUrl;

  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    this.initialLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int numOfLikes;

  @override
  void initState() {
    super.initState();
    numOfLikes = widget.initialLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FB_DARK_PRIMARY,
        centerTitle: true,
        title: Text(
          "Macemook",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                      radius: ScreenUtil().setWidth(25),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.date,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(5)),
                            Icon(Icons.public,
                                size: ScreenUtil().setSp(16),
                                color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.more_horiz,
                        size: ScreenUtil().setSp(20), color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Text(
                  widget.postContent,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (widget.imageUrl.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          numOfLikes++;
                        });
                      },
                      icon: const Icon(Icons.thumb_up, color: FB_DARK_PRIMARY),
                      label: Text(
                        numOfLikes.toString(),
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: FB_DARK_PRIMARY,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                      label: Text(
                        "Comment",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: FB_DARK_PRIMARY,
                        ),
                      ),
                    ),
                    // Share Button
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY),
                      label: Text(
                        "Share",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: FB_DARK_PRIMARY,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
