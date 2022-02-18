import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/constants.dart';
import 'package:flutter_youtube_ui/screens/NavigationBar.dart';
import 'package:flutter_youtube_ui/screens/watch_Screen.dart';

import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final bool hasPadding;
  const VideoCard({Key? key, required this.video, required this.hasPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding
          ? const EdgeInsets.symmetric(horizontal: 12)
          : const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.read(selectedVideo).state = video;
              context
                  .read(selectedMinicontroll)
                  .state
                  .animateToHeight(state: PanelState.MAX);
              context.read(youtubePlayerController).state =
                  YoutubePlayerController(
                      initialVideoId: video.id,
                      flags: const YoutubePlayerFlags(
                        autoPlay: true,
                        loop: false,
                      ));
            },
            child: Stack(
              children: [
                Image.network(
                  video.thumbnailUrl,
                  fit: BoxFit.cover,
                  height: 220,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  child: Container(
                    padding: EdgeInsets.all(kDefaultPadding / 4),
                    child: Text(
                      video.duration,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding / 4,
                bottom: kDefaultPadding),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(video.author.profileImageUrl),
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      Flexible(
                        child: Text(
                          '${video.author.username} .  ${video.viewCount} .  ${timeago.format(video.timestamp)} ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            ),
          )
        ],
      ),
    );
  }
}
