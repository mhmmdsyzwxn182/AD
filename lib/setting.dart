



import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white38,
              Colors.white70,
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile Settings'),
                trailing: Icon(Icons.keyboard_arrow_right),

                onTap: () {
                  // Handle profile settings action
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notification Settings'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Handle notification settings action
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.security),
                title: Text('Security Settings'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Handle security settings action
                },
              ),
            ),
            // Add more settings options here
          ],
        ),
      ),
    );
  }
}