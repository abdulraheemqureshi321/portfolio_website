import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/sns_link.dart';

import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return  Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,

      child:  Column(
        children: [
          //title
          const Text('Get in touch', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: CustomColor.whitePrimary),),

          const SizedBox(height: 50,),

          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 700,
              maxHeight: 100,

            ),
            child: LayoutBuilder(
              builder: (context, constraints){
              if(constraints.maxWidth >= kMinDesktopWidth) {
                return buildNameEmailFieldDesktop();
              }
              // else
                return buildNameEmailFieldMobile();
            },)


          ),


          const SizedBox(height: 15,),
          //message
          ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: 700,
              ),
              child: const CustomTextField(hintText: 'Message',maxLines: 16,)),
          // Send button
          const SizedBox(height: 20,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child
                : SizedBox(
              width: screenWidth,
              child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary
                ), child: const Text("Get in touch", style: TextStyle(color: CustomColor.whitePrimary),),
              ),
            ),
          ),

          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),
          const SizedBox(height: 15,),

          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: (){
                    js.context.callMethod('open', [SnsLink.github]);
                  },
                  child: Image.asset("github.png", width: 28,)),
              InkWell(
                  onTap: (){
                    js.context.callMethod('open', [SnsLink.linkedin]);
                  },
                  child: Image.asset("linkedin.png", width: 28,)),
              InkWell(
                  onTap: (){
                    js.context.callMethod('open', [SnsLink.facebook]);
                  },
                  child: Image.asset("facebook.png", width: 28,)),
              InkWell(
                  onTap: (){
                    js.context.callMethod('open', [SnsLink.instagram]);
                  },
                  child: Image.asset("instagram.png", width: 28,)),
              InkWell(
                  onTap: (){
                    js.context.callMethod('open', [SnsLink.telegram]);
                  },
                  child: Image.asset("telegram.png", width: 28,)),

            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop(){
    return const Row(
      children: [
        // name
        Flexible(
            child: CustomTextField(hintText: 'Your name',)),
        SizedBox(width: 15,),
        // email
        Flexible(
            child: CustomTextField(hintText: 'Email',))
      ],
    );
  }
  Column buildNameEmailFieldMobile(){
    return const Column(
      children: [
        // name
        Flexible(
            child: CustomTextField(hintText: 'Your name',)),
        SizedBox(height: 15,),
        // email
        Flexible(
            child: CustomTextField(hintText: 'Email',))
      ],
    );
  }

}
