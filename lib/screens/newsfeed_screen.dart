import 'package:flutter/material.dart';

import '../widgets/post_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewsfeedCard(
          userName: 'Kapitan Nino Muhlach',
          postDate: DateTime(2024, 10, 28),
          postContent: 'Good Morning, Guys!',
          profileImageUrl: 'assets/images/NINO1.jpg',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
          initialLikes: 3,
        ),
        NewsfeedCard(
          userName: 'Kap Nino Barzaga',
          postDate: DateTime(2024, 10, 28),
          postContent: 'Nahuli aquo',
          profileImageUrl: 'assets/images/NINO3.jpg',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
          initialLikes: 5,
        ),
        NewsfeedCard(
          userName: 'WFOJFJO',
          postDate: DateTime(2024, 10, 28),
          postContent: ' aquo',
          profileImageUrl: 'assets/images/NINO3.jpg',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
          initialLikes: 1,
        ),
        NewsfeedCard(
          userName: 'HOTDOG',
          postDate: DateTime(2024, 10, 28),
          postContent: 'Nahuli',
          profileImageUrl: 'assets/images/NINO1.jpg',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
          initialLikes: 0,
        ),
        NewsfeedCard(
          userName: 'JJMAN',
          postDate: DateTime(2024, 10, 28),
          postContent: 'raffymen',
          profileImageUrl: 'assets/images/NINO3.jpg',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIMx7g-45SHDLyouPzs5fTwhKZfapSBsJJQ&s',
          initialLikes: 9,
        ),
      ],
    );
  }
}
