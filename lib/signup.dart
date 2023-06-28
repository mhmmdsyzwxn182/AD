import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:untitled2/db.dart';
import 'package:untitled2/user_model.dart';


class SignupPage extends StatefulWidget {
  @override
  _Signup createState()=>_Signup();
}

class _Signup extends State<SignupPage>{
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController c_password = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  GlobalKey<FormState> signupkey = GlobalKey<FormState>();

  var database;

  void initState(){
    super.initState();
    database = DbHelper();
  }


  //DATABASE INSERT INTO TRIGGER PAKAI VAR DATABASE
  signup() async {
    String _username = username.text;
    String _email = email.text;
    String _pw = password.text;
    String cpw = c_password.text;
    String phone = phoneNo.text;

    if (signupkey.currentState!.validate()) {
      if (_pw != cpw) {

        return alert(context, title: Text('Password Mismatch', textAlign: TextAlign.center), content: Text('Please check password'), textOK: Text('OK'),);

      } else {
        signupkey.currentState!.save();

        UserDetail uModel = UserDetail(_username, _email, _pw, phone);
        await database.saveData(uModel).then((userData) {

          return alert(context, title: Text('Create Account Success', textAlign: TextAlign.center), content: Text('Successfully Saved'), textOK: Text('OK'),);

        }).catchError((error) {
          print(error);

          return alert(context, title: Text('Error', textAlign: TextAlign.center), content: Text('Username already exist'), textOK: Text('OK'),);

        });
      }
    }
  }

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Form(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              key: signupkey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text ("Sign up", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(height: 20,),
                          Text("Create an account for free",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),),
                          const SizedBox(height: 30,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: username,
                              decoration: InputDecoration(hintText: 'username',),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'username empty !';
                                }
                                else{
                                  return null;
                                }
                              },

                            ),
                            SizedBox(height: 30,),

                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(hintText: 'email',),
                              validator: (value){
                                if(value!.isEmpty)
                                  {
                                    return 'Email empty !';
                                  }
                                else{
                                  return null;
                                }
                              },

                            ),

                            SizedBox(height: 30,),
                            TextFormField(
                              controller: phoneNo,
                              decoration: InputDecoration(hintText: 'Phone Number',),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'phone number empty !';
                                }
                                else{
                                  return null;
                                }
                              },

                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: password,
                              decoration: InputDecoration(hintText: 'Password', ),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'password empty !';
                                }
                                else{
                                  return null;
                                }
                              },

                              obscureText: true,
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: c_password,
                              decoration: InputDecoration(hintText: 'Confirm password', ),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'confirm password empty !';
                                }
                                else{
                                  return null;
                                }
                              },

                              obscureText: true,
                            ),
                            SizedBox(height: 50,),
                            FloatingActionButton.extended(
                              extendedPadding: EdgeInsets.all(150),

                              onPressed: signup,  label: Text('Sign up'),

                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                ],

              ),

            ),
          ),
        ),
      ),
    );
  }
}