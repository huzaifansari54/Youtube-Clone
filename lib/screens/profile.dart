import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_back_ios_new),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://yt3.ggpht.com/yti/APfAmoEkEZaAhn-972lUOYr7VSrxfEPkOvnMIf0dltNjtQ=s48-c-k-c0x00ffffff-no-rj'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                            color: Colors.blueAccent),
                        width: 10,
                        height: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Hizaifa Ansari',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    flex: 4,
                  ),
                  // const SizedBox(
                  //   width: 200,
                  // ),
                  Expanded(child: Icon(Icons.more_vert))
                ],
              ),
            ),
            Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Suscribers',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '15k',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Follower',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('2.8k', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Followng',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('1k', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aboute Huzaifa',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hi I am  App Devloper and Youtube user \nI create this App using  Youtube API Thank you Google ',
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 3,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
