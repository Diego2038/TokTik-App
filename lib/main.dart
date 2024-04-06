import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {

    final VideoPostRepository videoPostRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider( videoPostRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tok Tik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}

 
