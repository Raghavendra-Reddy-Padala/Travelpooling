
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_pool/intropage1.dart';
import 'package:travel_pool/intropage2.dart';
import 'package:travel_pool/intropage3.dart';
import 'package:travel_pool/loginpage.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  //controler ti keep a track on which we are i
  PageController  _pageController=PageController();
  //keep a track on if we are on last page or not
  bool onLastPage=false;
  bool onMiddlePage=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              onLastPage=(index==2 );
              onMiddlePage=(index==1);
            });
            
          },
        children:const [
         IntroPage1(),
         Intropage2(),
         Intropage3()
        ],
      ),
      Container(
        alignment:const Alignment(0,0.95),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            onMiddlePage || onLastPage?
                        //skip
           GestureDetector(
            onTap: () {
              if(onLastPage){
                _pageController.jumpToPage(1);
              }else{
              _pageController.jumpToPage(0);
              }
            },
            child: Container(
               padding:const  EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),   
              color: Colors.yellow
            ),
              child: const  Text("Back",style:TextStyle(fontWeight: FontWeight.bold),))
            ):            //skip
           GestureDetector(
            onTap: () {
              _pageController.jumpToPage(2);
            },
            child:
               Container(
                 padding:const  EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),   
              color: Colors.yellow
            ),
                child: const  Text("Skip",style: TextStyle(fontWeight: FontWeight.bold),))
            ),

            SmoothPageIndicator(controller: _pageController, count: 3),
       onLastPage ?
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Driverrider();
              }));
            },
            child: Container(
               padding:const  EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),   
              color: Colors.yellow
            ),
              child: const  Text("Sign Up",style:TextStyle(fontWeight: FontWeight.bold),))
            ):GestureDetector(
            onTap: () {
    _pageController.nextPage(duration:
    const Duration(milliseconds: 500),
     curve: Curves.easeIn);
            },
            child: Container(
               padding:const  EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),   
              color: Colors.yellow
            ),
              child: const  Text("Next",style:TextStyle(fontWeight: FontWeight.bold),))
            )
          ],
        ))
      ],
      )
    );
  }
}