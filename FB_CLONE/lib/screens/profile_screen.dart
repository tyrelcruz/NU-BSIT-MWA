import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/widgets/customfont.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  final String? username;
  const ProfileScreen({super.key, this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcuNjynYrM9ByvYYuXUv1RxCosGTZWlqthqA&s'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: ScreenUtil().setWidth(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbmQulZzZ-aiQeHJrqsOtiFcXLu8XwLNgQLw&s'), // Add a valid URL
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(55)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: widget.username ?? 'Tyrel Cruz',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomFont(
                          text: '1.2K ',
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        CustomFont(
                          text: 'followers',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Icon(
                          Icons.circle,
                          size: ScreenUtil().setSp(5),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        CustomFont(
                          text: '1.9K ',
                          fontSize: ScreenUtil().setSp(13),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        CustomFont(
                          text: 'following',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)), // Move inside
                    Row(
                      children: [
                        CustomButton(
                          buttonName: 'Follow',
                          onPressed: () {},
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomButton(
                          buttonName: 'Message',
                          onPressed: () {},
                          buttonType: 'outlined',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              TabBar(
                indicatorColor: FB_DARK_PRIMARY,
                tabs: [
                  Tab(
                    child: CustomFont(
                      text: 'Posts',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'About',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'Photos',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2000),
                child: TabBarView(
                  children: [
                    _postTab(),
                    _aboutTab(),
                    _photosTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _postTab() {
  return Column(
    children: [
      NewsfeedCard(
        userName: 'user123',
        postDate: DateTime(2024, 10, 28),
        postContent: 'change q profile q',
        profileImageUrl: 'assets/images/stllr.jpg',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
        initialLikes: 0,
      ),
      NewsfeedCard(
        userName: 'Tyrel Cruz',
        postDate: DateTime(2024, 10, 28),
        postContent: 'Good Morning, Guys!',
        profileImageUrl: 'assets/images/stllr.jpg',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
        initialLikes: 3,
      ),
      NewsfeedCard(
        userName: 'Tyrel Cruz',
        postDate: DateTime(2024, 10, 28),
        postContent: 'Picture q',
        profileImageUrl: 'assets/images/stllr.jpg',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
        initialLikes: 5,
      ),
      NewsfeedCard(
        userName: 'Tyrel Cruz',
        postDate: DateTime(2024, 10, 28),
        postContent: ' aquo',
        profileImageUrl: 'assets/images/stllr.jpg',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
        initialLikes: 1,
      ),
    ],
  );
}

Widget _aboutTab() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.favorite, color: Colors.red), // Icon for relationship
            SizedBox(width: ScreenUtil().setWidth(10)),
            CustomFont(
              text: 'Relationship: ',
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            CustomFont(
              text: 'Single', // Update as per the user's status
              fontSize: ScreenUtil().setSp(16),
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Row(
          children: [
            Icon(Icons.school, color: Colors.blue), // Icon for studies
            SizedBox(width: ScreenUtil().setWidth(10)),
            CustomFont(
              text: 'Studies at: ',
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            CustomFont(
              text: 'National University: Manila',
              fontSize: ScreenUtil().setSp(16),
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Row(
          children: [
            Icon(Icons.cake, color: Colors.pink), // Icon for age
            SizedBox(width: ScreenUtil().setWidth(10)),
            CustomFont(
              text: 'Age: ',
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            CustomFont(
              text: '21',
              fontSize: ScreenUtil().setSp(16),
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Row(
          children: [
            Icon(Icons.videogame_asset, color: Colors.green),
            SizedBox(width: ScreenUtil().setWidth(10)),
            CustomFont(
              text: 'Hobbies: ',
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            CustomFont(
              text: 'Playing Video Games',
              fontSize: ScreenUtil().setSp(16),
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Divider(color: Colors.grey),
      ],
    ),
  );
}

Widget _photosTab() {
  List<String> photoUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs6WZYhmbIv3eDtmke0ocdPTWGEQx-QX36Og&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh5qUP7rm61nG_t9L2G3Iz_vDRH-b33WT11Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb1rS3rP1Rw1NtkSEDV3iHA-M-QloR1v5IUQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQCMi1YgUWo9g9QsE-TSsEBAoCG6yanHPkhw&s',
  ];

  return Padding(
    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: photoUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Image.network(
                  photoUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              photoUrls[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}
