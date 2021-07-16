import 'package:flutter/material.dart';
import 'package:flutter_sharemarket/constants/controller.dart';
import 'package:flutter_sharemarket/controller/dashboard_controller.dart';
import 'package:flutter_sharemarket/screens/dashboard/dashboard.dart';
import 'package:get/get.dart';

import 'constants/firebase_constants.dart';
import 'screens/login/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(DashboardController());
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
      home: Dashboard(),
    );
  }
}

