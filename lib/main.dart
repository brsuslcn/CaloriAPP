import 'package:calori_app/splash_screen.dart';
import 'package:calori_app/view_models/providers/food_api_provider.dart';
import 'package:calori_app/view_models/providers/nav_provider.dart';
import 'package:calori_app/view_models/providers/user_provider.dart';
import 'package:calori_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<NavigationProvider>(create: (_) => NavigationProvider()),
        ListenableProvider<UserProvider>(create: (_) => UserProvider()),
        ListenableProvider<FoodApiProvider>(create: (_) => FoodApiProvider()),

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        home: SplashScreen(),
      ),
    );
  }
}
