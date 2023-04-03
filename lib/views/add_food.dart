import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/add_form.dart';
import '../components/custom_bottombar.dart';

class AddFood extends StatelessWidget {
  const AddFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black, title: Text("Food Add")),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 23,
          ),
          Expanded(child: AddFormWidget())
        ]),
      ),
    );
  }
}
