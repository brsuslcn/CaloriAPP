import 'package:calori_app/view_models/providers/nav_provider.dart';
import 'package:calori_app/views/home_page.dart';
import 'package:calori_app/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/add_food.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

   // final token = ModalRoute.of(context)?.settings.arguments;


    return TabBar(
      indicatorWeight: 0.000001,
      labelPadding: EdgeInsets.zero,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.purpleAccent,
      onTap: (i) { Provider.of<NavigationProvider>(context, listen: false).setScreenIndex(i);

        },

      tabs: [
        Container(
          width: double.infinity,
          color: Colors.black,
          child: Tab(
            icon: Icon(Icons.home_outlined),
          ),
        ),
        Container(
            width: double.infinity,
            color: Colors.black,
            child: Tab(icon: Icon(Icons.food_bank_outlined))),
        Container(
            width: double.infinity,
            color: Colors.black,
            child: Tab(icon: Icon(Icons.person_4_outlined)))
      ],
    );

  }
}









// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

//   @override
//   Widget build(BuildContext context) {
//     // return BottomNavigationBar(
//     //   //backgroundColor: Colors.black,
//     //   items: const <BottomNavigationBarItem>[
//     //     BottomNavigationBarItem(
//     //       backgroundColor: Colors.black,
//     //       icon: Icon(Icons.home),
//     //       label: 'Home',
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.business),
//     //       label: 'Business',
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.school),
//     //       label: 'School',
//     //     ),
//     //   ],
//     //   currentIndex: _selectedIndex,
//     //   selectedItemColor: Colors.amber[800],
//     //   onTap: _onItemTapped,
//     // );
//     return TabBar(
//         onTap: (index) {
//           setState(() {});
//         },
//         indicatorWeight: 0.000001,
//         // indicatorPadding: EdgeInsets.zero,
//         indicatorColor: Colors.transparent,
//         labelPadding: EdgeInsets.zero,
//         tabs: [
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               width: double.infinity,
//               color: Colors.black,
//               child: Tab(
//                 child: Icon(Icons.home),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               width: double.infinity,
//               color: Colors.black,
//               child: Tab(
//                 child: Icon(Icons.home),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               width: double.infinity,
//               color: Colors.black,
//               child: Tab(
//                 child: Icon(Icons.home),
//               ),
//             ),
//           ),
//         ]);
//   }
// }
