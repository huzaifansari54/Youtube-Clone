import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/widget/custom_app_bar.dart';

import 'package:flutter_youtube_ui/widget/video_card.dart';

class YouTubeHom extends StatefulWidget {
  const YouTubeHom({Key? key}) : super(key: key);

  @override
  _YouTubeHomState createState() => _YouTubeHomState();
}

class _YouTubeHomState extends State<YouTubeHom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustumSliverAppBar(),
          //  RecomandationBar(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return VideoCard(
                  video: videos[index],
                  hasPadding: false,
                );
              }, childCount: videos.length),
            ),
          ),
        ],
      ),
    );
  }
}
