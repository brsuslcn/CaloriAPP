import 'dart:developer';
import 'dart:io';

import 'package:calori_app/models/usermodel_realtime.dart';
import 'package:calori_app/view_models/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';
import '../../view_models/services/services.dart';

class RegisterPageTextForm extends StatefulWidget {
  const RegisterPageTextForm({super.key});

  @override
  State<RegisterPageTextForm> createState() => _RegisterPageTextFormState();
}

class _RegisterPageTextFormState extends State<RegisterPageTextForm> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    passwordConfirmController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Container(
                    width: 300,
                    height: 300,
                    child: LottieBuilder.asset(
                        "assets/lottie/registerAnimation.json")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldName(usernameController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldAge(ageController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldHeight(heightController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldWeight(weightController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldMail(emailController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldPassword(passwordController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textfieldPassword(passwordConfirmController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _costumRegisterButton(() async{



                    if(passwordController.text == passwordConfirmController.text)
                      {
                        await Provider.of<UserProvider>(context,listen: false).postUser(emailController.text, passwordController.text, ageController.text, heightController.text, weightController.text);


                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Register Successful!'),
                            duration: Duration(seconds: 3), // Snackbar'ın ekranda kalacağı süre
                            action: SnackBarAction(
                              label: 'Okay',
                              onPressed: () {
                                //
                              },
                            ),
                          ),
                        );


                      }

                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Please enter password correct!'),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Okay',
                              onPressed: () {
                                //
                              },
                            ),
                          ),
                        );
                      }




                  /* UserModelRT newUserRT = UserModelRT(name:usernameController.text, email: emailController.text, weight: weightController.text, height: heightController.text, age: ageController.text);
                    Provider.of<UserProvider>(context, listen: false).postUserRT(newUserRT);*/




                    //Services service = Services();
                    //service.postUser(newUser, ageController.text, heightController.text,weightController.text);

                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _costumRegisterButton(Function() onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textfield(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldName(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Name",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.person),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldHeight(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Height",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.height),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldWeight(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Weight",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.accessibility_new_rounded),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldAge(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Age",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.numbers),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldMail(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.email),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }

  Widget _textfieldPassword(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.lock),
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 3, color: Colors.purple),
          )),
    );
  }
}
  // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(width: 1, color: Colors.purple),
        // ),