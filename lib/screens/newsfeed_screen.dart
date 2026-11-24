
import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'JK',
          postContent: '집에 갔다가 자고',
          numOfLikes: 1000000,
          date: 'October 11',
          hasImage: true,
          imageAsset: 'assets/images/jungkook.jpg',
          avatarAsset: 'assets/images/jk.jpg',
        ),

        NewsFeedCard(
          userName: 'Jungwon Yang',
          postContent: '날이 많이 찹니다 감기 조심하십시오♡',
          numOfLikes: 900067,
          date: 'December 2',
          hasImage: true,
          imageAsset: 'assets/images/jungwon.jpg',
          avatarAsset: 'assets/images/jw.jpg',
        ),
      ],
    );
  }
}