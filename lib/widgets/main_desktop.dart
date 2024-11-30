import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, ),
      height: screenHeight/2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hi, \nI'm Abdul Raheem \nA Flutter Developer", style: TextStyle(
                  fontSize: 30.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary
              ),),
              const SizedBox(height: 15,),
              SizedBox(
                width: 250,
                child: ElevatedButton(onPressed: () {}, child: const Text("Get in touch"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.yellowPrimary
                  ),
                ),
              )
            ],
          ),

          Image.asset(
              width: screenWidth/2,
              'assets/main1.png'
          )
        ],
      ),
    );
  }
}
