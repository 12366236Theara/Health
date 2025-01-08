import 'package:app_kiloit/Home_page_Screen/HomePage_Screen.dart';
import 'package:app_kiloit/Messengeer-Page_Screen/Messenger_Page_Screen.dart';

import 'package:app_kiloit/Notification-Page_Screen/Notification_Screen.dart';
import 'package:app_kiloit/Profile_Screen/Profile_Screen.dart';

import 'package:flutter/material.dart';

class Navigabaar extends StatefulWidget {
  const Navigabaar({super.key});

  @override
  State<Navigabaar> createState() => _NavigabaarState();
}

class _NavigabaarState extends State<Navigabaar> {
  int _selechteindex = 0;
  static final List<Widget> _page = <Widget>[
    HomepageScreen(
      categories: const [],
    ),
    MessengerPageScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  void _onItemTappent(int index) {
    setState(() {
      _selechteindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page.elementAt(_selechteindex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        unselectedItemColor: const Color(0xffC7C6C5),
        backgroundColor: const Color(0xffFFFFFF),
        fixedColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.mark_unread_chat_alt_outlined)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
        ],
        currentIndex: _selechteindex,
        onTap: _onItemTappent,
      ),
    );
  }
}
