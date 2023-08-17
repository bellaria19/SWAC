import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탐색'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => PostCardScreen(index: index),
                  builder: (context) => PostCard(post: postList[index]),
                ),
              );
            },
            child: Container(
              color: Colors.grey,
              child: Center(
                // child: Image.network('https://placekitten.com/200/200'),
                child: Image.network(postList[index].postImageUrl),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostCardScreen extends StatelessWidget {
  final int index;

  PostCardScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostCard 화면'),
      ),
      body: Center(
        child: Text('PostCard 화면 - 카테고리 $index'),
      ),
    );
  }
}

List<PostCardModel> postList = [
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 100,
    caption: 'Caption for Post 1',
  ),
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 1000,
    caption: 'Caption for Post 2',
  ),
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 90,
    caption: 'Caption for Post 3',
  ),
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 80,
    caption: 'Caption for Post 4',
  ),
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 700,
    caption: 'Caption for Post 5',
  ),
  PostCardModel(
    avatarImageUrl: 'https://placekitten.com/200/300',
    username: 'User1',
    postImageUrl: 'https://placekitten.com/300/400',
    likeCount: 60,
    caption: 'Caption for Post 6',
  ),
];

class PostCardModel {
  final String avatarImageUrl;
  final String username;
  final String postImageUrl;
  final int likeCount;
  final String caption;

  PostCardModel({
    required this.avatarImageUrl,
    required this.username,
    required this.postImageUrl,
    required this.likeCount,
    required this.caption,
  });
}

class PostCard extends StatelessWidget {
  final PostCardModel post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostCard 화면'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.avatarImageUrl),
              ),
              SizedBox(width: 10),
              Text(
                post.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          CachedNetworkImage(
            imageUrl: post.postImageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            'Liked by ${post.likeCount} people',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                post.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Text(post.caption),
            ],
          ),
        ],
      ),
    );
  }
}
