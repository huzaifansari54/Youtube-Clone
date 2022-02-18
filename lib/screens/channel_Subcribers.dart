import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/Services/getServices.dart';
import 'package:flutter_youtube_ui/widget/custom_app_bar.dart';

class SubriptionScreen extends StatelessWidget {
  const SubriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, _) {
        final subcribers = watch(getSubription);
        return Column(
          children: [
            const SizedBox(height: 20),
            subcribers.when(
                data: (value) => Expanded(
                      child: CustomScrollView(
                        shrinkWrap: true,
                        slivers: [
                          CustumSliverAppBar(),
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            value[index]
                                                .snippet
                                                .thumbnails
                                                .medium
                                                .url),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(value[index].snippet.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              value[index].snippet.description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider()
                                ],
                              )),
                            );
                          }, childCount: value.length))
                        ],
                      ),
                    ),
                loading: () => Center(child: const CircularProgressIndicator()),
                error: (e, trace) => Center(
                      child: Text(e.toString()),
                    ))
          ],
        );
      }),
    );
  }
}
