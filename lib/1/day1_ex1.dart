import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class Day1Ex1View extends StatefulWidget {
  const Day1Ex1View({super.key});

  @override
  State<Day1Ex1View> createState() => _Day1Ex1ViewState();
}

class _Day1Ex1ViewState extends State<Day1Ex1View> {
  int remainingSeconds = 7 * 60;
  Timer? timer;
  late VideoPlayerController _controller;
  bool _isVideoReady = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/vid/7.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoReady = true;
        });
      }).catchError((error) {
        print('Error loading video: $error');
      });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String get formattedTime {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();
        }
      });
    }
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void handleVideoPlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        pauseTimer();
      } else {
        _controller.play();
        startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1'),
        centerTitle: true,
        backgroundColor: TColor.kPrimaryColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVideoReady)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleVideoPlayPause,
              child: Text(_controller.value.isPlaying
                  ? 'Pause Video & Timer'
                  : 'Play Video & Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
