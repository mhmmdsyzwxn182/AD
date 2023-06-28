import 'package:flutter/material.dart';
import 'package:untitled2/menu_data.dart';
import 'package:untitled2/menu_details.dart';

class ListViewDemo extends StatefulWidget {
  String username;

   ListViewDemo({Key? key, required this.username}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<MenuData> menuDataList = [
    MenuData(
      imagePath: "assets/Burger.jpg",
      name: "Burger Bee",
      description: "RM 7.00",
      price: 7,
      ingredient: 'Spicy beef burger with a secret sauce',
    ),
    MenuData(
      imagePath: "assets/cikencop.jpg",
      name: "Chicken Chop",
      description: "RM 10.00",
      price: 10,
      ingredient: 'Chicken Breast, Black pepper sauce, fries, coleslaw',
    ),
    MenuData(
      imagePath: "assets/spageti.jpg",
      name: "Spagetti",
      description: "RM 8.00",
      price: 8,
      ingredient: 'Prego sauce, milk cream, pepper, sausage',
    ),
    MenuData(
      imagePath: "assets/lambchop.jpg",
      name: "Lamb Chop",
      description: "RM 14.00",
      price: 14,
      ingredient: 'Bbq sauce, lamb, coleslow',
    ),
    MenuData(
      imagePath: "assets/aye.png",
      name: "Ayam Korea Bee",
      description: "RM 10.00",
      price: 10,
      ingredient: 'chili sauce, aye, bijan',
    ),
    MenuData(
      imagePath: "assets/fishchip.jpg",
      name: "Fish n Chip",
      description: "RM 9.00",
      price: 9,
      ingredient: 'mayoniese, fish, fries',
    ),
    MenuData(
      imagePath: "assets/fries.jpg",
      name: "Fries Bee",
      description: "RM 6.00",
      price: 6,
      ingredient: 'fries, chili sauce, mayoniese',
    ),
    MenuData(
      imagePath: "assets/meatball.jpg",
      name: "Meatball Bee",
      description: "RM 10.00",
      price: 10,
      ingredient: 'mayoniese, meat, black paper souce, salad',
    ),
    MenuData(
      imagePath: "assets/mushroomsup.jpg",
      name: "Mushroom Sup",
      description: "RM 6.00",
      price: 6,
      ingredient: 'mushroom, garlic, sup',
    ),
    MenuData(
      imagePath: "assets/onionring.jpg",
      name: "Onion Ring",
      description: "RM 7.00",
      price: 7,
      ingredient: 'onion, chli souce, egg',
    ),
    MenuData(
      imagePath: "assets/pizzapetok.jpg",
      name: " Pizza Kotak Bee",
      description: "RM 12.00",
      price: 12,
      ingredient: 'pizza, chesee',
    ),
    MenuData(
      imagePath: "assets/rimatiyok.jpeg",
      name: " Harimau Tiyok",
      description: "RM 10.00",
      price: 10,
      ingredient: 'meat, thai souce',
    ),
    MenuData(
      imagePath: "assets/wedges.jpg",
      name: " Wedges Bee",
      description: "RM 6.00",
      price: 6,
      ingredient: 'potatos, chesee, mayoniese',
    ),
    MenuData(
      imagePath: "assets/jusbuah.png",
      name: "Jus Buah Bee",
      description: "RM 5.00",
      price: 5,
      ingredient: 'carrot, manggo, watermelon, orange',
    ),
    MenuData(
      imagePath: "assets/kopi.jpg",
      name: " Kopi Bee",
      description: "RM 7.00",
      price: 7,
      ingredient: 'americano, latte, cappuchino',
    ),
    MenuData(
      imagePath: "assets/float.jpg",
      name: "Float Bee",
      description: "RM 3.00",
      price: 3,
      ingredient: 'mug, ice, ice cream',
    ),
      MenuData(
      imagePath: "assets/leleh.jpg",
      name: " Teh Kuning",
      description: "RM 4.00",
      price: 4,
      ingredient: 'teh, honey, ice cream',
    ),
      MenuData(
      imagePath: "assets/teahija.jpg",
      name: "Teh Hijau",
      description: "RM 4.00",
      price: 4,
      ingredient: 'teh, honey, macha',
    ),
      MenuData(
      imagePath: "assets/sirapbandung.jpg",
      name: "Sirap bandung Cincau",
      description: "RM 4.00",
      price: 3,
      ingredient: 'sirap, cincau, ice cream',
      )
  ];

  List<MenuData> cartItems = <MenuData>[]; // Initialize with an empty list
  void addToCart(MenuData menuData) {
    setState(() {
      cartItems.add(menuData);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: menuDataList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final menuData = menuDataList[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the menu details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDetailsPage(
                    menuData: menuData,
                    addToCart: addToCart,
                    cartItems: cartItems,
                    username: widget.username,
                  ),
                ),
              );
            },
            child: ListTile(
              leading: AspectRatio(
                aspectRatio: 2.0,
                child: Image.asset(
                  menuData.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(menuData.name),
              subtitle: Text(menuData.description),
            ),
          );
        },
      ),
    );
  }
}
