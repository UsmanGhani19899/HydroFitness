import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HydroVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool? loop;
  const HydroVideoPlayer({
    required this.videoPlayerController,
    this.loop,
  });

  @override
  _HydroVideoPlayerState createState() => _HydroVideoPlayerState();
}

class _HydroVideoPlayerState extends State<HydroVideoPlayer> {
  late ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        // looping: widget.loop,

        looping: false,
        //fullScreenByDefault: true,
        // showControls: true,
        allowFullScreen: true,
        //aspectRatio: 16 / 9,
        autoPlay: false,
        autoInitialize: true,
        showControlsOnInitialize: true,
        // ignore: prefer_const_constructors
        placeholder: Center(
            // ignore: prefer_const_constructors
            child: SizedBox(
                height: 60,
                width: 60,
                // ignore: prefer_const_constructors
                child: CircularProgressIndicator(
                  color: Colors.green,
                ))),
        materialProgressColors: ChewieProgressColors(
          bufferedColor: Colors.green,
          handleColor: Colors.green,
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     _controller = VideoPlayerController.asset(
//       'assets/images/cardio.mp4',
//     );

//     _initializeVideoPlayerFuture = _controller.initialize();

//     _controller.setLooping(false);
//     //_controller.play();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // floatingActionButton: FloatingActionButton(onPressed: () {}),
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Container(
//               color: Colors.black,
//               height: MediaQuery.of(context).size.height,
//               child: VideoPlayer(_controller)),
//         ));
//   }
// }
