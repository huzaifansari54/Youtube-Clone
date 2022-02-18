import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:flutter_youtube_ui/Models/Video_By_Id.dart';
import 'package:flutter_youtube_ui/constants.dart';
import 'package:flutter_youtube_ui/screens/NavigationBar.dart';
import 'package:flutter_youtube_ui/screens/watch_Screen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopularVideos extends StatelessWidget {
  final Item video;
  bool isLoad;
  final String imageUrl;
  PopularVideos(
      {Key? key,
      required this.video,
      required this.isLoad,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String viewCount = convert(video.statistics!.viewCount);
    String duration = convertDuration(video.contentDetails.duration);
    return isLoad
        ? Consumer(builder: (context, watch, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // context.read(selectedVideo).state = video;

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
                        video.snippet.thumbnails.medium.url,
                        fit: BoxFit.cover,
                        height: 220,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: kDefaultPadding / 2,
                        right: kDefaultPadding / 2,
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding / 4),
                          child: Text(
                            duration,
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
                      top: kDefaultPadding,
                      bottom: kDefaultPadding),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
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
                                video.snippet.title,
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
                                '${video.snippet.channelTitle} .  $viewCount .  ${timeago.format((video.snippet.publishedAt))} ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontWeight: FontWeight.normal),
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
            );
          })
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  String convert(String view) {
    var length = view.length;
    switch (length) {
      case 1:
      case 2:
      case 3:
        return view;

      case 4:
        var first = view.substring(0, length - 3);
        var last = view.substring(1, length - 2);

        return first + '.' + last + 'K';
      case 5:
        return view.substring(0, length - 3) + 'K';
      case 6:
        return view.substring(0, length - 3) + 'K';
      case 7:
        var first = view.substring(0, length - 6);
        var last = view.substring(1, length - 5);

        return first + '.' + last + 'M';
      case 8:
        return view.substring(0, length - 6) + 'M';
      case 9:
        return view.substring(0, length - 6) + 'M';

      default:
        return view.substring(0, length - 8) + 'M';
    }
  }

  String convertDuration(String duration) {
    RegExp regex = new RegExp(r'(\d+)');
    List<String> a =
        regex.allMatches(duration).map((e) => e.group(0)!).toList();

    if (duration.indexOf('M') >= 0 &&
        duration.indexOf('H') == -1 &&
        duration.indexOf('S') == -1) {
      a = ["0", a[0], "0"];
    }

    if (duration.indexOf('H') >= 0 && duration.indexOf('M') == -1) {
      a = [a[0], "0", a[1]];
    }
    if (duration.indexOf('H') >= 0 &&
        duration.indexOf('M') == -1 &&
        duration.indexOf('S') == -1) {
      a = [a[0], "0", "0"];
    }

    int minute = 0;
    int seconds = 0;

    if (a.length == 3) {
      seconds = seconds + int.parse(a[0]) * 3600;
      minute = minute + int.parse(a[0]) * 60;
      seconds = seconds + int.parse(a[1]) * 60;
      minute = minute + int.parse(a[1]);
      seconds = seconds + int.parse(a[2]);
    }

    if (a.length == 2) {
      seconds = seconds + int.parse(a[0]);
      minute = minute + int.parse(a[0]);
      seconds = seconds + int.parse(a[1]);
    }

    if (a.length == 1) {
      seconds = seconds + int.parse(a[0]);
    }
    return minute.toString() + ':' + seconds.toString();
  }
}
