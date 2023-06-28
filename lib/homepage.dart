import 'package:flutter/material.dart';
import 'package:untitled2/cart_page.dart';
import 'package:untitled2/homescreen.dart';
import 'package:untitled2/menu_data.dart';
import 'package:untitled2/menu_list.dart';
import 'package:untitled2/profile.dart';
import 'package:untitled2/setting.dart';

class HomePage extends StatefulWidget {
  String username;
  HomePage({required this.username});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<MenuData> cartItems = <MenuData>[];

  late String username; // Declare a variable to store the username

  @override
  void initState() {
    super.initState();
    username = widget.username; // Assign the username from the widget to the variable
  }

  @override
  Widget build(BuildContext context) {
    Widget profilePage = ProfileScreen(uname: username);
    Widget listViewPage = ListViewDemo(username: username,);
    Widget settingsPage = SettingsScreen();

    final List<Widget> _pages = [
      listViewPage,
      settingsPage,
      profilePage,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beeli Food', textAlign: TextAlign.center),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delivery_dining_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems, username: username,)),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

