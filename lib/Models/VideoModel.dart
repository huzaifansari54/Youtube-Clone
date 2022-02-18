// To parse this JSON data, do
//
//     final videoById = videoByIdFromJson(jsonString);

import 'dart:convert';

VideoById videoByIdFromJson(String str) => VideoById.fromJson(json.decode(str));

String videoByIdToJson(VideoById data) => json.encode(data.toJson());

class VideoById {
  VideoById({
    required this.kind,
    required this.etag,
    required this.items,
    required this.pageInfo,
  });

  String kind;
  String etag;
  List<Item> items;
  PageInfo? pageInfo;

  factory VideoById.fromJson(Map<String, dynamic> json) => VideoById(
        kind: json["kind"],
        etag: json["etag"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "pageInfo": pageInfo!.toJson(),
      };
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.statistics,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;
  Statistics? statistics;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        statistics: json["statistics"] == null
            ? null
            : Statistics.fromJson(json["statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
        "statistics": statistics!.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    required this.duration,
    required this.dimension,
    required this.definition,
    required this.caption,
    required this.licensedContent,
    required this.contentRating,
    required this.projection,
  });

  String duration;
  String dimension;
  String definition;
  String caption;
  bool licensedContent;
  ContentRating? contentRating;
  String projection;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        duration: json["duration"] ?? '',
        dimension: json["dimension"] ?? '',
        definition: json["definition"] ?? '',
        caption: json["caption"] ?? '',
        licensedContent: json["licensedContent"] ?? false,
        contentRating: null == json["contentRating"]
            ? null
            : ContentRating.fromJson(json["contentRating"]),
        projection: json["projection"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "dimension": dimension,
        "definition": definition,
        "caption": caption,
        "licensedContent": licensedContent,
        "contentRating": contentRating!.toJson(),
        "projection": projection,
      };
}

class ContentRating {
  ContentRating();

  factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating();

  Map<String, dynamic> toJson() => {};
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.categoryId,
    required this.liveBroadcastContent,
    required this.localized,
    required this.defaultAudioLanguage,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String categoryId;
  String liveBroadcastContent;
  Localized? localized;
  String defaultAudioLanguage;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"] ?? '',
        categoryId: json["categoryId"] ?? '',
        liveBroadcastContent: json["liveBroadcastContent"] ?? "",
        localized: null == json["localized"]
            ? null
            : Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "localized": localized!.toJson(),
        "defaultAudioLanguage": defaultAudioLanguage,
      };
}

class Localized {
  Localized({
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: null == json["standard"]
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            null == json["maxres"] ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard!.toJson(),
        "maxres": maxres!.toJson(),
      };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"] ?? '',
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Statistics {
  Statistics({
    required this.viewCount,
    required this.likeCount,
    required this.favoriteCount,
    required this.commentCount,
  });

  String viewCount;
  String likeCount;
  String favoriteCount;
  String commentCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"] ?? '',
        likeCount: json["likeCount"] ?? '',
        favoriteCount: json["favoriteCount"] ?? '',
        commentCount: json["commentCount"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
      };
}

class PageInfo {
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
