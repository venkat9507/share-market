import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sharemarket/constants/controller.dart';
import 'package:flutter_sharemarket/controller/dashboard_controller.dart';
import 'package:flutter_sharemarket/screens/dashboard/dashboard.dart';
import 'package:flutter_sharemarket/screens/firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'constants/firebase_constants.dart';
import 'screens/login/login_page.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel('high_importance_channel', 'High Importance Notifications', 'This channel is used for important notifications',importance: Importance.high,playSound: true,);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future <void> _firebaseMessagingBackgroundhandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) async{
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundhandler);
    Get.put(DashboardController());

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>().createNotificationChannel(channel);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true,badge: true,sound: true,);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseMessagingDemo(),
      // Dashboard(),
    );
  }
}

