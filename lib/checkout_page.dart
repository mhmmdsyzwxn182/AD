import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/menu_data.dart';
import 'package:untitled2/thankyou_page.dart';

class StepperDemo extends StatefulWidget {
  final List<MenuData> cartItems;
  final int totalPrice;
  final List<int> quantitities;

  StepperDemo({required this.cartItems, required this.totalPrice, required this.quantitities});
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  TextEditingController cardnumController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
      children: [
      IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
    Text('                  Checkout'),
    ],
    ),

        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Cart Items:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  final quantity = widget.quantitities[index];
                  return ListTile(
                    leading: Image.asset(item.imagePath),
                    title: Text(item.name),
                    subtitle: Text('Quantity: $quantity'),
                    trailing: Text('RM ${item.price * quantity}'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Price: ${widget.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(color: Colors.grey,),


            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: _currentStep == 1 ? null : continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: Text('Customer Detail'),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'Full Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(labelText: 'Phone Number'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(labelText: 'Adress'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: Text('Payment'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller : cardnumController,
                          decoration: InputDecoration(labelText: 'Card Number'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your card number';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: expireController,
                          decoration: InputDecoration(labelText: 'mm/yy'),
                          keyboardType: TextInputType.number,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the Expire';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cvvController,
                          decoration: InputDecoration(labelText: 'CVV'),
                          keyboardType: TextInputType.number,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the CVV';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){
                final form = _formKey.currentState;

                if(form!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ThankYouPage( cartItems: widget.cartItems,
                    totalPrice: widget.totalPrice,
                    quantities: widget.quantitities,
                    fullName: nameController.text,
                    phoneNumber: phoneController.text,
                    address: addressController.text,
                    cardNumber: cardnumController.text,
                    expiry: expireController.text,
                    cvv: cvvController.text, username: '')));
                  alert(context, title: Text('Payment Done!', textAlign: TextAlign.center), content: Text('We will complete your order'), textOK: Text('OK'),);
                }
              },
              child: Text('Submit'),

            ),

          ],
        ),
      ),
    );
  }


  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
