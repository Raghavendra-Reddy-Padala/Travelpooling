import 'package:flutter/material.dart';
import 'package:travel_pool/driver_login.dart';
import 'package:travel_pool/traveller_login.dart';

class Driverrider extends StatelessWidget {
  const Driverrider({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.8,  // Responsive width
              child: Image.asset("assets/logo.jpeg"),
            ),
            const SizedBox(height: 20), // Spacing between image and text
            const Text(
              "Who Are You",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20), // Spacing before bottom section
            Container(
              width: screenWidth,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.red[300],
              ),
              child: Column(
                children: [
                  const Text(
                    "Choose Your Specific Login Details",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20), // Spacing between text and buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenWidth * 0.35, // Responsive button width
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DriverLogin();
                            })
                            );
                          },
                          child: const Text(
                            "Driver Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.35, // Responsive button width
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const TravellerLogin();
                            }));
                          },
                          child: const Text(
                            "Traveller Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
