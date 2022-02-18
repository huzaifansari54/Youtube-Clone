import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/Models/Video_By_Id.dart';
import 'package:flutter_youtube_ui/Services/Service.dart';
import 'package:flutter_youtube_ui/Services/getServices.dart';
import 'package:flutter_youtube_ui/widget/custom_app_bar.dart';
import 'package:flutter_youtube_ui/widget/most_Poplare.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Item> mostPopularVideo = [];
  String imageUrl = '';
  List<String> image = [];
  List<String> url = [];

  @override
  void initState() {
    super.initState();
  }

  loadChannel(List<Item> item) async {
    for (var i = 0; i < item.length; i++) {
      image.add(item[i].snippet.channelId);
    }
    for (var i = 0; i < image.length; i++) {
      imageUrl = await ApiService.instance.getChennal(image[i]);
      context.read(channelProviderList).state.add(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, _) {
        List<String> url = watch(channelProviderList).state;

        AsyncValue<List<Item>> _videos = watch(mostPopular);

        return _videos.when(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          data: (value) {
            loadChannel(value);

            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: CustomScrollView(
                      slivers: [
                        CustumSliverAppBar(),
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return PopularVideos(
                              video: value[index],
                              isLoad: true,
                              imageUrl: url.isEmpty
                                  ? 'https://yt3.ggpht.com/ytc/AKedOLSsnWm_dQzIqM-qgW74yebXNX_b__k6WAeUBb6GeGQ=s240-c-k-c0x00ffffff-no-rj'
                                  : url[index]);
                        }, childCount: value.length)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

// class mostPoularScreen extends ConsumerWidget {
//   const mostPoularScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     AsyncValue<List<Item>> _videos = watch(mostPopular);
//      AsyncValue<List<String>> _image = watch(urls);

//     return Scaffold(
//       body: Column(
//         children: [
//           _videos.when(
//             loading: () => Center(
//               child: CircularProgressIndicator(),
//             ),
//             error: (error, stackTrace) => Center(
//               child: Text(error.toString()),
//             ),
//             data: (value) => Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return PopularVideos(
//                       imageUrl: _image.when(
//                         data: (value) => value[index],
//                         loading: () =>
//                             'https://yt3.ggpht.com/ytc/AKedOLSsnWm_dQzIqM-qgW74yebXNX_b__k6WAeUBb6GeGQ=s240-c-k-c0x00ffffff-no-rj',
//                         error: (e, stacktrace) =>
//                             'https://yt3.ggpht.com/ytc/AKedOLSsnWm_dQzIqM-qgW74yebXNX_b__k6WAeUBb6GeGQ=s240-c-k-c0x00ffffff-no-rj',
//                       ),
//                       video: value[index],
//                       isLoad: true);
//                 },
//                 itemCount: value.length,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
