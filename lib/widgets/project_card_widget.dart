import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.bgLight2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            "assets/projects/project1.jpg",height: 140, width: 250,),

          const Padding(
            padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text("Title", style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),),
          ),
          //subtitle
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text("Some dummy subtitle about the project", style: TextStyle(
              fontSize: 10,
              color: CustomColor.whitePrimary,
            ),),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const Text('Available on:', style: TextStyle(color: CustomColor.yellowSecondary, fontSize: 10),),
                const Spacer(),
                InkWell(
                    onTap: (){},
                    child: Image.asset('assets/ios.png', width: 17,)),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                      onTap: (){},
                      child: Image.asset('assets/android.png', width: 19,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                      onTap: (){},
                      child: Image.asset('assets/web.png', width: 17,)),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
