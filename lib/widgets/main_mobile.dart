import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
      height: screenHeight/2,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds){
              return LinearGradient(colors: [
                CustomColor.scaffoldBg,
                CustomColor.scaffoldBg.withOpacity(0.6)
              ]).createShader(bounds);
            },

            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/main1.png',
                width: screenWidth/2,
              ),
            ),
          ),
          const Text("Hi, \nI'm Abdul Raheem \nA Flutter Developer", style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
          ),),
          const SizedBox(height: 15,),
          SizedBox(
            width: 190,
            child: ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary
              ), child: const Text("Get in touch"),
            ),
          )
        ],
      ),
    );
  }
}
