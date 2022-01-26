import 'package:flutter/material.dart';

// import 'about_screen.dart';
import '../widgets/drawer_user_controller.dart';
import '../widgets/home_drawer.dart';
// import 'feedback_screen.dart';
// import 'help_screen.dart';
import 'home_screen.dart';
// import 'invite_friend_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView = const MyHomePage();
  DrawerIndex drawerIndex = DrawerIndex.home;

  @override
  Widget build(BuildContext context) {
    return DrawerUserController(
      screenIndex: drawerIndex,
      drawerWidth: MediaQuery.of(context).size.width * 0.75,
      onDrawerCall: (DrawerIndex drawerIndexdata) {
        changeIndex(drawerIndexdata);
        //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
      },
      screenView: screenView,
      //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        if (mounted) {
          setState(() {
            screenView = const MyHomePage();
          });
        }
      } else if (drawerIndex == DrawerIndex.help) {
        if (mounted) {
          setState(() {
            // screenView = const HelpScreen();
            screenView = const Text('1');
          });
        }
      } else if (drawerIndex == DrawerIndex.feedback) {
        if (mounted) {
          setState(() {
            // screenView = const FeedbackScreen();
            screenView = const Text('2');
          });
        }
      } else if (drawerIndex == DrawerIndex.invite) {
        if (mounted) {
          setState(() {
            // screenView = const InviteFriend();
            screenView = const Text('3');
          });
        }
      } else if (drawerIndex == DrawerIndex.about) {
        if (mounted) {
          setState(() {
            // screenView = const AboutScreen();
            screenView = const Text('4');
          });
        }
      }
    }
  }
}
