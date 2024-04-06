


import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {

  String name;
  String videoUrl;
  int likes;
  int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views    
  });


  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json ) => LocalVideoModel(
    name: json["name"] ?? "no name",
    videoUrl: json["videoUrl"],
    likes: json["likes"] ?? 0,
    views: json["views"] ?? 0    
  );

  Map<String, dynamic> toJson() => {
    "caption": name,
    "videoUrl": videoUrl,
    "likes": likes,
    "views": views, 
  };

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );

}