import 'package:flutter/material.dart';

import '../data.dart';

class secondHeader extends StatelessWidget {
  const secondHeader({
    Key? key,
    required this.video,
  }) : super(key: key);
  final Video? video;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _headerBuilder(Icons.thumb_up, video!.likes, context),
        _headerBuilder(Icons.thumb_down, video!.dislikes, context),
        _headerBuilder(Icons.share, 'Share', context),
        _headerBuilder(Icons.download_outlined, 'Download', context),
        _headerBuilder(Icons.save_alt_rounded, 'Save', context)
      ],
    );
  }

  Column _headerBuilder(IconData iconData, String name, BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
