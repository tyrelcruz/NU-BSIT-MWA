import 'package:flutter/material.dart';
import 'package:myapp/screens/detail_screen.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final DateTime postDate;
  final String postContent;
  final String profileImageUrl;
  final int initialLikes;
  final String imageUrl;

  const NewsfeedCard({
    Key? key,
    required this.userName,
    required this.postDate,
    required this.postContent,
    required this.profileImageUrl,
    required this.initialLikes,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  userName: userName,
                  postContent: postContent,
                  date: "${postDate.toLocal()}".split(' ')[0],
                  imageUrl: imageUrl,
                  profileImageUrl: profileImageUrl,
                  initialLikes: initialLikes,
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(profileImageUrl),
                            radius: 25,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${postDate.toLocal()}".split(' ')[0],
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Kebab menu
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Edit') {
                          } else if (value == 'Delete') {
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'Delete',
                            child: Text('Delete'),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert), // Kebab menu icon
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    postContent,
                    style: const TextStyle(fontSize: 14),
                  ),
                  if (imageUrl.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.thumb_up_alt_outlined, size: 20),
                  const SizedBox(width: 5),
                  Text('$initialLikes likes'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.comment_outlined, size: 20),
                  const SizedBox(width: 5),
                  const Text('Comment'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.share_outlined, size: 20),
                  const SizedBox(width: 5),
                  const Text('Share'),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImageUrl),
                radius: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write a comment...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              const Icon(Icons.comment_outlined, size: 20),
              const SizedBox(width: 5),
              Text("View all comments"),
            ],
          ),
        ),
      ],
    );
  }
}
