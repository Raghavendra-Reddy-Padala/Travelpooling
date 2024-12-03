import 'package:flutter/material.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Set the height of the image to 350 pixels
              SizedBox(
                width: screenWidth, // Set the width to screen width
                height: 300, // Set fixed height to 350 pixels
                child:Image.asset('assets/intro3.jpeg')
              ),
                Container(
                width: screenWidth,
                margin:const  EdgeInsets.only(top: 20.0), // Vertical margin for the text
                padding:const  EdgeInsets.only(top: 10), // Padding for the text
                child: Container(
                  width: screenWidth,
                  padding:const  EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    color: Colors.grey[300]
                  ),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text:const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Our Vision\n',
                          style: TextStyle(
                            fontSize: 22, // Larger font size for the title
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Color for the title
                          ),
                        ),
                         TextSpan(
                          text: ("\n")
                        ),
                        TextSpan(
                          text: ('Is to see you travel seamlessly without any disturbances in a cheap means of way'),
                          style: TextStyle(
                            fontSize: 16, // Smaller font size for the description
                            fontWeight: FontWeight.normal,
                            color: Colors.black, // Slightly lighter color for description
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

