import 'package:flutter/material.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/menu_data.dart';

class ThankYouPage extends StatelessWidget {
  String username;
  final List<MenuData> cartItems;
  final int totalPrice;
  final List<int> quantities;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String cardNumber;
  final String expiry;
  final String cvv;

  ThankYouPage({
    required this.cartItems,
    required this.totalPrice,
    required this.quantities,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.cardNumber,
    required this.expiry,
    required this.cvv,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 150.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Thank you for your payment!\nYou will be redirect to homepage soon', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () {
                // Navigate back to the home page or any other desired page
               Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> HomePage(username: username)), (Route<dynamic>route)=>false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

