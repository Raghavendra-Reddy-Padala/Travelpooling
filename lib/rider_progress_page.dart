import 'package:flutter/material.dart';
import 'dart:async';

class RideProgressPage extends StatefulWidget {
  const RideProgressPage({super.key});

  @override
  State<RideProgressPage> createState() => _RideProgressPageState();
}

class _RideProgressPageState extends State<RideProgressPage> {
  int _remainingTime = 300; // 5 minutes in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Progress'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rider is close to you and is coming!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '$minutes:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
