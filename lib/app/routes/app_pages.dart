import 'package:get/get.dart';
import '../bindings/auth_binding.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../routes/app_routes.dart';
import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/auth/sign_up_screen.dart';
class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: AuthBinding(), 
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
