import 'package:calori_app/components/textfield_component.dart';
import 'package:calori_app/models/usermodel.dart';
import 'package:calori_app/view_models/providers/user_provider.dart';
import 'package:calori_app/views/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_login_model.dart';
import '../../view_models/services/services.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                    child: Text("Login Account",
                        style: TextStyle(
                          fontFamily: 'CaviarDreams',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFieldComponent(
                        textEditingController: _emailController,
                        hintText: "E-Mail",
                        ico: Icon(Icons.email_outlined),
                        obsecure: false),
                  ),
                  TextFieldComponent(
                      textEditingController: _passwordController,
                      hintText: "Password",
                      ico: Icon(Icons.lock),
                      obsecure: true),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () async {

                         UserLoginModel logUser = UserLoginModel(email: _emailController.text, password: _passwordController.text);

                         await  Provider.of<UserProvider>(context,listen: false).login(logUser, context).toString();



                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Don't you have any accounts yet?",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ))
                ],
              ),
            )));
  }
}
