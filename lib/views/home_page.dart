import 'package:calori_app/components/custom_bottombar.dart';
import 'package:calori_app/view_models/providers/nav_provider.dart';
import 'package:calori_app/views/add_food.dart';
import 'package:calori_app/views/main_page.dart';
import 'package:calori_app/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = const [MainPage(), AddFood(), ProfilePage()];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: screens[Provider.of<NavigationProvider>(context).getScreenIndex],
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
