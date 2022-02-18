import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/Models/Video_By_Id.dart';
import 'package:flutter_youtube_ui/Services/Service.dart';

final channelProviderList = StateProvider<List<String>>((ref) => []);
final mostPopular = FutureProvider<List<Item>>((ref) async {
  return ApiService.instance.getMostPopularList();
});
final getSubription = FutureProvider<List<Item>>((ref) async {
  return ApiService.instance.getSubcribers();
});

