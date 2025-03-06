import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      title: 'Flutter GetX Project',
      initialRoute: '/login', // Start with login screen
      getPages: AppPages.routes, // Load defined routes
    );
  }
}
