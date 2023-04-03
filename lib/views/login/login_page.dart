import 'package:calori_app/components/login_components/login_top.dart';
import 'package:flutter/material.dart';

import '../../components/login_components/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [LoginTop(), LoginBody()],
      ),
    );
  }
}