import 'package:flutter/material.dart';
import 'dart:async'; // For Timer
import 'package:video_player/video_player.dart';

class Day1Ex3View extends StatefulWidget {
  const Day1Ex3View({super.key});

  @override
  State<Day1Ex3View> createState() => _Day1Ex3ViewState();
}

class _Day1Ex3ViewState extends State<Day1Ex3View> {
  int remainingSeconds = 5 * 60; // Initial countdown time (5 minutes)
  Timer? timer; // Timer object
  bool isRunning = false; // To track whether the timer is running or not
  bool isVideoPlaying = false; // To track whether the video is playing or not

  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vid/5.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  String get formattedTime {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (!isRunning) {
      setState(() {
        isRunning = true;
      });

      timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();
          setState(() {
            isRunning = false;
          });
        }
      });
    }
  }

  void pauseTimer() {
    if (timer != null && isRunning) {
      timer?.cancel();
      setState(() {
        isRunning = false;
      });
    }
  }

  void handlePlayPause() {
    if (isRunning || isVideoPlaying) {
      // Pause both timer and video
      pauseTimer();
      if (_controller.value.isPlaying) {
        _controller.pause();
      }
      setState(() {
        isVideoPlaying = false;
      });
    } else {
      // Start both timer and video
      startTimer();
      _controller.play();
      setState(() {
        isVideoPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isVideoInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handlePlayPause,
              child: Text(
                (isRunning || isVideoPlaying)
                    ? 'Pause Video & Timer'
                    : 'Play Video & Timer',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              formattedTime, // Display formatted time
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
