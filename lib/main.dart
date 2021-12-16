import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sec_project_chatbot/Screens/SignIn/ripples.dart';
import 'package:sec_project_chatbot/Screens/profile.dart';

import 'Screens/chat_screen/chat.dart';
import 'Screens/homeScreen.dart';
void main() {
  runApp(ripples());
}
//
// class MyApp extends StatelessWidget {
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(new FocusNode());
//         },
//         child: MaterialApp(
//             home:
//             //LoginScreen()
//             // home:
//             MyHomePage()));
//    // return MyHomePage();
//   }

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> pages = [
    homeScreen(),
    chat(),
    owner(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_page],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color.fromRGBO(200, 160, 100, 50)),
          child: CurvedNavigationBar(

            height: 70,
            animationDuration: Duration(microseconds: 8000),
            backgroundColor: Colors.white,
            key: _bottomNavigationKey,
            color: Colors.purple,
            items: <Widget>[
              Icon(Icons.home_filled, size: 30, color: _page == 0 ? Colors.white : Colors.black,),
              Icon(Icons.chat_rounded, size: 30,color: _page == 1 ? Colors.white : Colors.black,),
              Icon(Icons.person_pin, size: 30,color: _page == 2 ? Colors.white : Colors.black,),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        ),

    );
  }
}