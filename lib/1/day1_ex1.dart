import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'dart:async'; // For Timer
import 'package:video_player/video_player.dart'; // For Video Player

class Day1Ex1View extends StatefulWidget {
  const Day1Ex1View({super.key});

  @override
  State<Day1Ex1View> createState() => _Day1Ex1ViewState();
}

class _Day1Ex1ViewState extends State<Day1Ex1View> {
  int remainingSeconds = 7 * 60; // Initial countdown time (7 minutes)
  Timer? timer; // Timer object
  late VideoPlayerController _controller; // Video player controller
  bool _isVideoReady = false; // Track if the video is ready to play

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/vid/7.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoReady = true; // Mark video as ready
        });
        // Don't play video immediately, allow user control
      }).catchError((error) {
        print('Error loading video: $error');
      });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when the widget is disposed
    _controller.dispose(); // Dispose video player controller
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
        pauseTimer(); // Pause timer when video pauses
      } else {
        _controller.play();
        startTimer(); // Start timer when video plays
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
            // Display the video player if the video is ready
            if (_isVideoReady)
              AspectRatio(
                aspectRatio: _controller
                    .value.aspectRatio, // Ensure correct aspect ratio
                child: VideoPlayer(_controller),
              )
            else
              const CircularProgressIndicator(), // Show a loader while video is loading
            const SizedBox(height: 20),
            Text(
              formattedTime, // Display formatted time
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
