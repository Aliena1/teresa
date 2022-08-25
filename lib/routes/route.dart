import 'package:get/get.dart';
import 'package:teresa/views/pages/profile/profile.dart';
import '../databinding/databinding.dart';
import '../views/pages/Signup/signup.dart';
import '../views/pages/available_job/available_job.dart';
import '../views/pages/bottom_navigation/bottom_navigation.dart';
import '../views/pages/login/change_password.dart';
import '../views/pages/login/create_new_password.dart';
import '../views/pages/login/forgot_password.dart';
import '../views/pages/login/login.dart';
import '../views/pages/login/security_code.dart';
import '../views/pages/splash_screen/splash_screen.dart';

class Routes{
  static final routes = [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/login', page: () => const Login()),
      GetPage(name: '/signUp', page: () => const SignUp()),
      GetPage(name: '/home', page: () => const TeresaBottomNavigation()),
      GetPage(name: '/forgotPassword', page: () => const ForgotPassword()),
      GetPage(name: '/securityCode', page: () => const SecurityCode()),
      GetPage(name: '/createNewPassword', page: () => const CreateNewPassword()),
      GetPage(name: '/changePassword', page: () => const ChangePassword()),
      GetPage(name: '/availableJob', page: () =>  AvailableJob()),
      GetPage(name: '/profileView', page: () => Profile(),binding: DataBinding()),
  ];
}