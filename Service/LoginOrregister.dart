import 'package:bloodapp/Screens/Registerpage.dart';
import 'package:bloodapp/Screens/loginpage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the Login screens
  bool showLoginPage = true;

  // toggle between login and Register
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
  if (showLoginPage) {
    return LogInPage(onTap: togglePages);
  } else{
    return RegisterPage(onTap: togglePages);
}
}
}