import 'package:flutter/widgets.dart';

// import '../design_course/home_design_course.dart';
// import '../fitness_app/fitness_app_home_screen.dart';
// import '../hotel_booking/hotel_home_screen.dart';

//@saadfattouh try to transfer this to card list in order to use included animations
class HomeList {
  HomeList({required this.navigateScreen, required this.imagePath});

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = <HomeList>[
    HomeList(
      // navigateScreen: const HotelHomeScreen(),
      navigateScreen: const Text('1'),
      imagePath: 'assets/images/amazon.png',
    ),
    HomeList(
      // navigateScreen: const FitnessAppHomeScreen(),
      navigateScreen: const Text('1'),
      imagePath: 'assets/images/google_play.png',
    ),
    HomeList(
      // navigateScreen: const DesignCourseHomeScreen(),
      navigateScreen: const Text('1'),
      imagePath: 'assets/images/pubg.png',
    ),
  ];
}
