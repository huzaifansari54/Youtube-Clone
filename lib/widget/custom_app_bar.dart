import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/widget/recomendation_widget.dart';

import '../constants.dart';
import '../data.dart';

class CustumSliverAppBar extends StatelessWidget {
  const CustumSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      flexibleSpace: RecomandationBar(),
      floating: true,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      leadingWidth: 105.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: Image.asset('assets/yt_logo_dark.png'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.cast,
            size: 25,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Badge(
              badgeContent: Text('2'),
              child: Icon(
                Icons.notifications_outlined,
                size: 25,
              ),
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                backgroundImage: NetworkImage(huzaifa.profileImageUrl),
                radius: 16)),
        SizedBox(
          width: kDefaultPadding,
        ),
      ],
    );
  }
}
