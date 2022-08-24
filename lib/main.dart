import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/routes/route.dart';
import 'package:teresa/views/pages/Signup/signup.dart';
import 'package:teresa/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:teresa/views/pages/login/change_password.dart';
import 'package:teresa/views/pages/login/create_new_password.dart';
import 'package:teresa/views/pages/login/security_code.dart';
import 'package:teresa/views/pages/login/forgot_password.dart';
import 'package:teresa/views/pages/login/login.dart';
import 'package:teresa/views/pages/schedule/schedule.dart';
import 'package:teresa/views/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Routes.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(AppColors.WHITE),
        fontFamily: "Helvetica"
        // primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
    );
  }
}
