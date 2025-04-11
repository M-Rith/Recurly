import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';
import 'app/controllers/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  Get.put(AuthController()); // Register AuthController globally

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter GetX Project",
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: AppRoutes.AUTH,
      getPages: AppPages.routes,
      builder: (context, child) {
        return SafeArea(child: child!);
      },
    );
  }
}
