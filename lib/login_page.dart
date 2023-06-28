import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/db.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/signup.dart';
import 'package:untitled2/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  var database;

  @override
  void initState() {
    super.initState();
    database = DbHelper();
  }

  login() async {
    String username = usernameController.text;
    String passwd = passwordController.text;

    if (username.isEmpty) {
      return alert(
        context,
        title: Text('Username Empty', textAlign: TextAlign.center),
        content: Text('Please Enter Username'),
        textOK: Text('OK'),
      );
    } else if (passwd.isEmpty) {
      return alert(
        context,
        title: Text('Password Empty', textAlign: TextAlign.center),
        content: Text('Please Enter Password'),
        textOK: Text('OK'),
      );
    } else {
      // Trigger database class using 'database'
      await database.getLoginUser(username, passwd).then((userData) {
        if (userData != null) {
          // Data check if valid, push and remove until
          // This route prevents going back
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomePage(username: username)),
                  (Route<dynamic> route) => false,
            );
          });
        } else {
          return alert(
            context,
            title: Text('Error', textAlign: TextAlign.center),
            content: Text('User Not Found. Please Create an Account'),
            textOK: Text('OK'),
          );
        }
      }).catchError((error) {
        print(error);
        return alert(
          context,
          title: Text('Error', textAlign: TextAlign.center),
          content: Text('Login Failed'),
          textOK: Text('OK'),
        );
      });
    }
  }

  Future setSP(UserDetail user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("user_name", user.user_name);
    sp.setString("password", user.password);
  }

  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.yellow, Colors.blueGrey],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.black12,
                  size: 120,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'username',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(250, 0),
                ),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.blue, // Adjusted to be less prominent
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
