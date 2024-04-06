


import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videoPostRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostRepository
  
  });

  Future<void> loadNextPage() async { 

    await Future.delayed(const Duration(seconds: 5));
    
    final newVideos = videoPosts.map((json) => LocalVideoModel.fromJsonMap(json).toVideoPostEntity()).toList();

    videos.addAll(newVideos); 

    initialLoading = false;

    notifyListeners();
  }

   

}