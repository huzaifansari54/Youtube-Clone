import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/Models/Video_By_Id.dart';

import 'package:flutter_youtube_ui/data.dart';

import 'package:flutter_youtube_ui/screens/NavigationBar.dart';
import 'package:flutter_youtube_ui/widget/second_Header.dart';
import 'package:flutter_youtube_ui/widget/video_card.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final youtubePlayerController =
    StateProvider.autoDispose<YoutubePlayerController>(
        (ref) => YoutubePlayerController(
            initialVideoId: ref.read(selectedVideo).state!.id,
            flags: YoutubePlayerFlags(
              autoPlay: true,
              loop: false,
            ))
          ..addListener(() {}));

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key, required this.video, this.item})
      : super(key: key);
  final Video video;
  final Item? item;

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  bool _isReady = false;

  @override
  void dispose() {
    context.read(youtubePlayerController).state.pause();
    super.dispose();
  }

  @override
  void deactivate() {
    context.read(youtubePlayerController).state.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, watch, _) {
      _isReady = false;

      final _youtubeController = watch(youtubePlayerController).state;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                YoutubePlayer(
                  progressColors: ProgressBarColors(
                      backgroundColor: Colors.white,
                      playedColor: Colors.redAccent,
                      handleColor: Colors.redAccent),
                  progressIndicatorColor: Colors.redAccent,
                  controller: _youtubeController,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('isReady');
                    _isReady = true;
                  },
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        context.read(youtubePlayerController).state.pause();
                        context
                            .read(selectedMinicontroll)
                            .state
                            .animateToHeight(state: PanelState.MIN);
                        // context.read(youtubePlayerController).state.pause();
                      },
                      icon: Icon(Icons.arrow_downward),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.video.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${widget.video.viewCount} views  . ${timeago.format(widget.video.timestamp)}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: secondHeader(
                          video: widget.video,
                        ),
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  widget.video.author.profileImageUrl),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(widget.video.author.username),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                          'subscribers  ${widget.video.author.subscribers}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        splashColor: Colors.blue,
                                        radius: 100,
                                        onTap: () {},
                                        child: Text(
                                          'JOIN',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  )
                                  // TextButton(
                                  //   onPressed: () {},
                                  //   child: Text('JOIN'),
                                  // ),
                                ],
                              ),
                            ),
                            Text('subscribers '.toUpperCase(),
                                style: TextStyle(color: Colors.red)),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.notifications)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return VideoCard(
                      video: suggestedVideos[index],
                      hasPadding: true,
                    );
                  }, childCount: suggestedVideos.length),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
    }));
  }

  Padding myDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        height: 0.4,
        width: double.infinity,
        color: Colors.grey[400],
      ),
    );
  }
}
