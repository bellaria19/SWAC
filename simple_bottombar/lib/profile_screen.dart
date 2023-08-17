import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://placekitten.com/200/200'),
          ),
          SizedBox(height: 16),
          Text(
            '사용자 이름',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('이메일 주소 또는 기타 정보'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('프로필 편집'),
          ),
          SizedBox(height: 16),
          Divider(),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('게시물'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('좋아요'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('댓글'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
