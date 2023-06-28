import 'package:flutter/material.dart';
import 'package:untitled2/cart_page.dart';
import 'package:untitled2/menu_data.dart';




class MenuDetailsPage extends StatelessWidget {
  final MenuData menuData;
  final Function(MenuData) addToCart;
  final List<MenuData> cartItems;
  bool isSelected = false;
  int get cartItemCount => cartItems.length;
  String username;


  MenuDetailsPage({required this.menuData, required this.addToCart, required this.cartItems, required this.username});
  @override
  Widget build(BuildContext context) {


    final imageWidget = Image.asset(
      menuData.imagePath,
      fit: BoxFit.cover,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${menuData.name}'),
          actions: <Widget>[
            IconButton(
              icon: Stack(
            children: [
            const Icon(Icons.delivery_dining),
          if (cartItemCount > 0)
                Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    cartItemCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
                    ],
        ),

              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems, username: username,)),);
              },
            ),
          ],
          backgroundColor:  Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: AspectRatio(
                            child: imageWidget,
                            aspectRatio: 33 / 9,
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -1),
                      blurRadius: 5,
                      color: Colors.black12,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding:
                        const EdgeInsets.only(top: 25, left: 25, right: 25),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[

                            const SizedBox(height: 3),
                            Text(
                              'Price: RM ${menuData.price}',
                              style: const TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: <Widget>[

                                const SizedBox(width: 15),


                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: <Widget>[

                                const SizedBox(width: 15),

                              ],
                            ),
                            const SizedBox(height: 15),

                            const SizedBox(height: 3),
                            Text(
                              '${menuData.description}',
                              style: const TextStyle(fontSize: 17),
                            )
                          ],
                        ), //col
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        addToCart(menuData);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Item added to cart')),
                        );
                      },
                      extendedPadding: const EdgeInsets.all(120),
                      backgroundColor: Colors.green,
                      label: const Text("Add to My Cart"),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

