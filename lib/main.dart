import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recurly/app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';
import 'app/controllers/auth_controller.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recurly/app/data/models/user_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('userBox');  // Open the box to store user data
  Get.put(AuthController()); // Register AuthController globally
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Set the color of the status bar
      statusBarIconBrightness:
          Brightness.light, // Set the icon brightness (light or dark)
    ) 
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter GetX Project",
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: AppRoutes.SPLASH_SCREEN,
      getPages: AppPages.routes,
    );
  }
}
