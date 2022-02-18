import 'dart:convert';

import 'dart:io';

import 'package:flutter_youtube_ui/Models/VideoModel.dart';
import 'package:flutter_youtube_ui/Services/resource.dart';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService._instantiate();

  static final ApiService instance = ApiService._instantiate();
  static String _baseUrl = 'youtube.googleapis.com';
  String base = '/youtube/v3/videos';

  Future<List<Item>> getMostPopularList() async {
    List<Item> videos = [];
    Map<String, String> parms = {
      "part": "snippet,contentDetails,statistics",
      "chart": "mostPopular",
      "maxResults": "8",
      "regionCode": "IN",
      "key": Resources.API_KEY
    };

    Uri url = Uri.https(_baseUrl, base, parms);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var exploreResponce = await http.get(url, headers: headers);

    if (exploreResponce.statusCode == 200) {
      VideoModel video = VideoModel.fromJson(json.decode(exploreResponce.body));

      videos = video.items;

      return videos;
    } else {
      throw (exploreResponce.statusCode);
    }
  }

  Future<String> getChennal(String channelId) async {
    List<Item> item = [];
    String URL = '';
    Map<String, String> parm = {
      "part": "snippet,contentDetails,statistics",
      "id": channelId,
      "key": Resources.API_KEY
    };
    Uri url = Uri.https(_baseUrl, '/youtube/v3/channels', parm);
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };
    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      VideoModel video = VideoModel.fromJson(json.decode(response.body));
      item = video.items;
      URL = item.first.snippet.thumbnails.medium.url;

      return URL;
    }
    throw (response.statusCode);
  }

  Future<List<Item>> getSubcribers() async {
    Map<String, String> parm = {
      "part": "snippet,contentDetails",
      "channelId": "UC-vLqOXBEl3QR1wvuE1UlrA",
      "maxResults": "20",
      "key": Resources.API_KEY
    };

    Uri url = Uri.https(_baseUrl, "/youtube/v3/subscriptions", parm);
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    var responce = await http.get(url, headers: header);
    if (responce.statusCode == 200) {
      print("responce ${responce.body}");
      VideoModel video = VideoModel.fromJson(json.decode(responce.body));

      return video.items;
    } else {
      throw (responce.statusCode);
    }
  }
}
