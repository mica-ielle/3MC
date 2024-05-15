import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/login_mobile.dart';
import 'package:troismconsulting/pages/login_web.dart';
// import 'package:troismconsulting/style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Responsive.isMobile(context)
          ? LoginPageMobile()
          : LoginPageWeb(
              usernameController: TextEditingController(),
              passwordController: TextEditingController(),
            ),
    );
  }
}
