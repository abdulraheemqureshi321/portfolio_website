import 'package:flutter/material.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/project_card.dart';

import '../constants/colors.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //work project title
          const Text('Work projects', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
          ),),
          screenWidth>=600 ?const SizedBox(height: 50,): const SizedBox(height: 30,),
          //work project cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children:[
                  for(int i=0; i<workProjectUtils.length;i++)
                    ProjectCard(project: workProjectUtils[i])
                ]),
          ),

          screenWidth>=600 ?const SizedBox(height: 50,): const SizedBox(height: 30,),

          const Text('Hobby projects', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
          ),),
          screenWidth>=600 ?const SizedBox(height: 50,): const SizedBox(height: 30,),
          //work project cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children:[
                  for(int i=0; i<hobbyProjectUtils.length;i++)
                    ProjectCard(project: hobbyProjectUtils[i])
                ]),
          )

        ],
      ),

    );
  }
}
