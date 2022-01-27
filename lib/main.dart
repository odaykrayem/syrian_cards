import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:syrian_cards/constants.dart';
import 'package:syrian_cards/screens/login_screen.dart';
import 'package:syrian_cards/screens/notification_screen.dart';
import 'package:syrian_cards/services/local_notifications_service.dart';

//onBackgroundMessage work on its own thread and it has its own isolate
//recieve message when app in background solution for on message
//work if app in background opened/closed
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

//@oday : change main function to async
//and  two lines of code added for initializing
void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "notification": (_) => const NotificationScreen(),
        "records": (_) => const NotificationScreen(),
      },
      title: 'Animated Text Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AnimatedTextExample _example;

  @override
  void initState() {
    super.initState();

    _example = animatedTextExamples();

    // seems context is delelted when pushreplacement
    LocalNotificationService.initialize(context);

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });

    // configOneSignel();
  }

  // Future<void> configOneSignel() async {
  //   await OneSignal.shared.setAppId(oneSignalAppId);
  // }

  // Future<void> getToken() async {
  //   var status = await OneSignal.shared.getPermissionSubscriptionState();
  //   String tokenId = status.subscriptionStatus.userId;
  // }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _example;

    int max = 2;
    int randomNumber = Random().nextInt(max) + 1;
    int duration = (randomNumber * 1000) + 4000;

    Future.delayed(Duration(milliseconds: duration), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const LoginPage()));
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: animatedTextExample.color),
                child: Center(
                  key: ValueKey(animatedTextExample.label),
                  child: animatedTextExample.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

AnimatedTextExample animatedTextExamples() => AnimatedTextExample(
      label: 'TextLiquidFill',
      color: Colors.white,
      child: TextLiquidFill(
        text: 'Syrian Cards',
        waveColor: Colors.blue,
        boxBackgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'Horizon',
        ),
        loadDuration: Duration(seconds: 4),
        waveDuration: Duration(seconds: 1),
      ),
    );
