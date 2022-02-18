import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_youtube_ui/screens/Explore_Trending.dart';

import '../constants.dart';

final selectedIndex = StateProvider<int>((ref) => 0);

class RecomandationBar extends StatefulWidget {
  const RecomandationBar({Key? key}) : super(key: key);

  @override
  State<RecomandationBar> createState() => _RecomandationBarState();
}

class _RecomandationBarState extends State<RecomandationBar> {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: Container(
          padding: EdgeInsets.only(top: 70),
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(Recomandation.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      context.read(selectedIndex).state = index;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: Consumer(builder: (context, watch, _) {
                        final _index = watch(selectedIndex).state;
                        return Container(
                          //  padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: _index == index
                                  ? Colors.white
                                  : Colors.black38,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade800)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding, vertical: 8),
                            child: Text(
                              Recomandation[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: _index != index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                })
                  ..insert(
                      0,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreScreen()));
                        },
                        child: Row(
                          children: [
                            Container(
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding,
                                      vertical: kDefaultPadding / 2),
                                  child: Row(
                                    children: [
                                      Icon(Icons.explore_outlined),
                                      const SizedBox(
                                        width: kDefaultPadding / 3,
                                      ),
                                      Text(
                                        'Explore',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              width: kDefaultPadding,
                            ),
                            Container(
                              width: 1,
                              height: 36,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ))),
          ),
        ),
      ),
    );
  }
}
