import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/Explore_Trending.dart';
import 'package:flutter_youtube_ui/screens/Youtube.dart';
import 'package:flutter_youtube_ui/screens/channel_Subcribers.dart';
import 'package:flutter_youtube_ui/screens/profile.dart';
import 'package:flutter_youtube_ui/screens/watch_Screen.dart';
import 'package:miniplayer/miniplayer.dart';

import '../constants.dart';

final selectedVideo = StateProvider<Video?>((ref) => null);
final _currentIndex = StateProvider<int>((ref) => 0);
final selectedMinicontroll = StateProvider.autoDispose<MiniplayerController>(
    (ref) => MiniplayerController());

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  static final double _minHieght = 60.0;

  final _pages = [
    YouTubeHom(),
    ExploreScreen(),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'explore',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    ),
    SubriptionScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, _) {
        final selectedVideos = watch(selectedVideo).state;
        final miniController = watch(selectedMinicontroll).state;
        final _current = watch(_currentIndex).state;

        return Stack(
          children: _pages
              .asMap()
              .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _current == 2 ? false : _current != i,
                    child: screen,
                  )))
              .values
              .toList()
            ..add(Offstage(
              offstage: selectedVideos == null,
              child: Miniplayer(
                  controller: miniController,
                  minHeight: _minHieght,
                  maxHeight: MediaQuery.of(context).size.height,
                  builder: (height, percentage) {
                    if (height >= _minHieght + 50.0)
                      return WatchScreen(
                        video: selectedVideos!,
                      );
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  selectedVideos!.thumbnailUrl,
                                  height: _minHieght - 5,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          selectedVideos.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: kDefaultPadding / 4,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${selectedVideos.author.username}',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_arrow)),
                              IconButton(
                                  onPressed: () {
                                    context.read(selectedVideo).state = null;
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          LinearProgressIndicator(
                            value: 0.6,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          )
                        ],
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    );
                  }),
            )),
        );
      }),
      bottomNavigationBar: Consumer(builder: (context, watch, _) {
        final _current = watch(_currentIndex).state;
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _current,
          onTap: (index) {
            index != 2
                ? context.read(_currentIndex).state = index
                : showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Create',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            bottomSheetItems(context, 'Create a Short',
                                Icons.play_circle_outlined),
                            bottomSheetItems(
                                context, 'Upload a video', Icons.upload),
                            bottomSheetItems(
                                context, 'Go live', Icons.live_tv_sharp),
                          ],
                        ),
                      );
                    },
                  );
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.explore),
                icon: Icon(Icons.explore_outlined),
                label: 'Explore'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.add_circle),
                icon: Icon(Icons.add_circle_outline),
                label: 'Add'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.subscriptions),
                icon: Badge(
                    badgeContent: Text(''),
                    child: Icon(Icons.subscriptions_outlined)),
                label: 'Subscription'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.video_library),
                icon: Icon(Icons.video_library_outlined),
                label: 'video'),
          ],
        );
      }),
    );
  }

  Row bottomSheetItems(BuildContext context, String titel, IconData iconData) {
    return Row(
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black38,
            ),
            child: Icon(iconData)),
        const SizedBox(
          width: 10,
        ),
        Text(
          titel,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
