import 'package:get/get.dart';
import '../bindings/auth_binding.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(), // Attach AuthBinding
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: AuthBinding(), // Reuse AuthBinding
    ),
  ];
}
