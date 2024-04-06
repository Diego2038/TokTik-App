


import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl extends VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) { 
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage (int page) async {
    
    await Future.delayed( const Duration(seconds: 5));

    final newVideos = videoPosts.map((json) => 
      LocalVideoModel.fromJsonMap(json).toVideoPostEntity()).toList();
    
    return newVideos;

  }

}