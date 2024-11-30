import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/drawar_mobile.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/main_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:constraints.maxWidth >= kMinDesktopWidth?null: DrawerMobile(onNavItemTap: (int navIndex){
            scaffoldKey.currentState?.closeEndDrawer();
            scrollToSection(navIndex);
          },),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarkeys.first),
                // Main
                if(constraints.maxWidth >= kMinDesktopWidth)
                 HeaderDesktop(onNavMenuTap: (int navIndex){
                   scrollToSection(navIndex);
                 },)
                else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},),

                if(constraints.maxWidth >= kMinDesktopWidth)
                 const MainDesktop()
                else
                 const MainMobile(),

                // Skills
                Container(
                  key: navbarkeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title
                      const Text('What I can do', style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary
                      ),),

                      //platform and skills
                      const SizedBox(height: 50.0,),

                    if(constraints.maxWidth>=kMedDesktopWidth)
                     const SkillsDesktop()
                    else
                     const SkillsMobile(),
                    ],
                  ),
                ),
                // Projects

                ProjectSection(key: navbarkeys[2],),
                const SizedBox(height: 30,),

                //Contact

                ContactSection(
                 key: navbarkeys[3],
               ),


                // Footer

                const Footer()
              ],
            ),
          ),
        );
      }
    );
  }


  void scrollToSection(int navIndex){
    if(navIndex == 4){
      //open a blog page

       return;
    }

    final key = navbarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
         duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut);
  }
}
