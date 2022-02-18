class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User Apdillion = User(
  username: 'Ap Dhillon',
  profileImageUrl:
      'https://yt3.ggpht.com/jI3p9-0oDtdnEUFDfcLJvVPlvFU00gbadPUkAQJ9ZjIy3S07_JvDxr60hSCfyiMSibDkosBhaeE=s176-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

const User huzaifa = User(
  username: 'Huzaifa Ansari',
  profileImageUrl:
      'https://yt3.ggpht.com/yti/APfAmoEkEZaAhn-972lUOYr7VSrxfEPkOvnMIf0dltNjtQ=s48-c-k-c0x00ffffff-no-rj',
  subscribers: '1k',
);
const User Tseries = User(
  username: 'T-Series',
  profileImageUrl:
      'https://yt3.ggpht.com/DzaZaTX6gdgjjPI_vkNc2dPbI794UroI9fTAunua0fa7lukDj5NDkjfhS5-w2KXuvXS02r92=s68-c-k-c0x00ffffff-no-rj',
  subscribers: '200m',
);
const User Flutter = User(
  username: 'Flutter',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '369k',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: huzaifa,
    title: 'Flutter Food Delivery App',
    thumbnailUrl: 'https://i.ytimg.com/vi/7dAt-JMSCVQ/maxresdefault.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: Tseries,
    id: '6DtPF9W3ejI',
    title: 'Mera wala Sardar',
    thumbnailUrl: 'https://i.ytimg.com/vi/6DtPF9W3ejI/hqdefault.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: huzaifa,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
  Video(
    id: '50qRPvg0CJg',
    author: Flutter,
    title: 'Flutter Vings',
    thumbnailUrl: 'https://i.ytimg.com/vi/50qRPvg0CJg/hq720.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '3.5K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: Tseries,
    id: '-Z3Y3EcpJi4',
    title: 'Uchiya Diwarn',
    thumbnailUrl: 'https://i.ytimg.com/vi/-Z3Y3EcpJi4/hqdefault.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '41M',
    likes: '2.2M',
    dislikes: '221k',
  ),
  Video(
    id: '8dd2Ss1eu7E',
    author: Flutter,
    title: 'DART Q/A Sessions ',
    thumbnailUrl: 'https://i.ytimg.com/vi/8dd2Ss1eu7E/hq720.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
  Video(
    id: '1WnraebbP60',
    author: Apdillion,
    title:
        'Kehndi Hundi Si Chan Tak Raah Bana De (Full Song) Ap Dhillon | Gurinder Gill | New Punjabi Song 2022',
    thumbnailUrl:
        'https://i.ytimg.com/vi/vX2cDW8LUWk/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBOI5B_vdugzw1X7mBYfAaE70r0VASSw',
    duration: '3:47',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '170M',
    likes: '2.8M',
    dislikes: '32K',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: huzaifa,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: huzaifa,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: huzaifa,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
  Video(
    id: 'rJKN_880b-M',
    author: huzaifa,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
];
