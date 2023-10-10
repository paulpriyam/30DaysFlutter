import 'package:flutter/material.dart';
import 'package:flutter01/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/ic_login.png"),
              SizedBox(
                height: 20,
              ),
              Text("Welcome $name",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.lato().fontFamily)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "User Name", hintText: "Enter user name"),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(buttonPressed ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            buttonPressed = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          await Navigator.pushNamed(
                              context, MyRoutes.homeRoute);
                          setState(() {
                            buttonPressed = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: buttonPressed ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: buttonPressed
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("click"),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
