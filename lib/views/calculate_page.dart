import 'package:calori_app/components/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.black, title: Text("CalculatePage")),
      body: Center(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
