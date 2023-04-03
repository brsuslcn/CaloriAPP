import 'package:calori_app/components/register/register_appbar.dart';
import 'package:calori_app/components/register/register_textform.dart';
import 'package:calori_app/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.black,
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage())), //return login page
              ),
              Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          )),
      body: SafeArea(
        child: RegisterPageTextForm(),
      ),
    );
  }
}
