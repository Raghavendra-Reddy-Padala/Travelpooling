
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_pool/rider_progress_page.dart';

class Traveelerui extends StatefulWidget {
  const Traveelerui({super.key});

  @override
  State<Traveelerui> createState() => _Traveelerui();
}

class _Traveelerui extends State<Traveelerui> {
  final TextEditingController _startLocationController = TextEditingController();
  final TextEditingController _endLocationController = TextEditingController();

  void _showDriverDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Rider Details', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/rider.jpg', // Replace with rider's image
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Rider Name: Sai Kumar ', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Vehicle Number: TS 08 6840'),
              const Text("Vehicle RE Himalayan"),
              const Text("Price : 420 Rupees")

            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RideProgressPage()),
                );
              },
              child: const Text('Accept', style: TextStyle(color: Colors.teal)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _startSearch();
              },
              child: const Text('Deny', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _startSearch() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Timer(const Duration(seconds: 15), () {
      Navigator.pop(context); // Close the progress indicator
      _showDriverDetails(context); // Show driver details popup
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/maps.jpeg', // Replace with rider's image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _startLocationController,
              decoration: InputDecoration(
                labelText: 'Start Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.location_on, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _endLocationController,
              decoration: InputDecoration(
                labelText: 'End Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.flag, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startSearch,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Search', style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}