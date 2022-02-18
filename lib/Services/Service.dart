import 'dart:convert';

import 'dart:io';

import 'package:flutter_youtube_ui/Models/Video_By_Id.dart';
import 'package:flutter_youtube_ui/Services/resource.dart';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService._instantiate();

  static final ApiService instance = ApiService._instantiate();
  static String _baseUrl = 'youtube.googleapis.com';
  String token = '';
  String base = '/youtube/v3/videos';

  Future<VideoById> fetchVideo({required String videoId}) async {
    VideoById _video = VideoById(
        kind: 'null',
        etag: 'null',
        items: [],
        pageInfo: PageInfo(resultsPerPage: 1, totalResults: 0));
    Map<String, String> parms = {
      "part": "snippet,contentDetails,statistics",
      "id": videoId,
      "key": Resources.API_KEY
    };
    Uri url = Uri.https(_baseUrl, base, parms);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print(response);
      _video = VideoById.fromJson(json.decode(response.body));
      print(_video.items.first.snippet.title);
      return _video;
    } else {
      print("error");
      return _video;
    }
  }

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
      VideoById videoById =
          VideoById.fromJson(json.decode(exploreResponce.body));

      videos = videoById.items;

      return videos;
    } else {
      throw ('ERORR');
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
      VideoById videoById = VideoById.fromJson(json.decode(response.body));
      item = videoById.items;
      URL = item.first.snippet.thumbnails.medium.url;

      return URL;
    }
    throw ('erroe');
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
      VideoById videoById = VideoById.fromJson(json.decode(responce.body));

      return videoById.items;
    } else {
      throw (responce.statusCode);
    }
  }
}
