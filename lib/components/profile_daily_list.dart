import 'package:flutter/material.dart';

class ProfileDailiyList extends StatelessWidget {
  const ProfileDailiyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: const Text(
          'Consumed',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Time",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          "Calori",
          style: TextStyle(color: Colors.white),
        ),
        dense: false,
      ),
    );
  }
}
