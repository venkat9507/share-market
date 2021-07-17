import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sharemarket/main.dart';
import 'package:get/get.dart';

class FirebaseMessagingDemo extends StatefulWidget {
  final String title = 'Firebase Messaging Demo';
  const FirebaseMessagingDemo({Key key}) : super(key: key);

  @override
  _FirebaseMessagingDemoState createState() => _FirebaseMessagingDemoState();
}

class _FirebaseMessagingDemoState extends State<FirebaseMessagingDemo> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken) {
      print('Device TOken: $deviceToken');
    });
  }



  void sendNotifications(){
    flutterLocalNotificationsPlugin.show(0, 'Title :Testing', 'Body of the Notifiation is this', NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,channel.name,channel.description,color: Colors.yellow,importance: Importance.high,playSound: true,icon: '@mipmap/ic_launcher'
      ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;
      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title, notification.body, NotificationDetails(
          android: AndroidNotificationDetails(channel.id,channel.name,channel.description,color: Colors.green,playSound: true,icon: '@mipmap/ic_launcher'),
        ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessaging event was Published');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;
      if(notification != null && android != null){
        Get.defaultDialog(
          title: notification.title,
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.body),
              ],
            ),
          )
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: sendNotifications,child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blue,),
    );
  }
}
