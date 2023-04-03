import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPageAppbar extends StatelessWidget {
  const RegisterPageAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Register Page",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 24,
        ),
      ),
    );
  }
}
