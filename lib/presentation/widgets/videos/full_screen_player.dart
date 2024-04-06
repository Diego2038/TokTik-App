import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/videos/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String caption;
  final String urlVideo;

  const FullScreenPlayer({
    super.key,
    required this.caption,
    required this.urlVideo,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset( widget.urlVideo )
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if( snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator( strokeWidth: 2,));
        }
        return GestureDetector(

          onTap: () {
            if ( controller.value.isPlaying ) {
              controller.pause();
              return;
            }
            controller.play();
          },

          // child: AspectRatio(
          //   aspectRatio: controller.value.aspectRatio,
          //   child: Placeholder()),

          child: AspectRatio( // TODO: AspectRatio genera errores inesperados, suerte con resolverlo
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                // const Placeholder(),
                // Gradiente

                VideoBackground(stops: const [0.8,1.0],),
        
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _CaptionVideo(caption: widget.caption),
                )
                
              ]),
          ),
        );
      },
    );
  }
}


class _CaptionVideo extends StatelessWidget {
  
  final String caption;
  
  const _CaptionVideo({
    required this.caption
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final styleTheme = Theme.of(context).textTheme.titleLarge;

    return SizedBox( 
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: styleTheme),);
  }
}