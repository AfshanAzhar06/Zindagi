import 'dart:async';

import 'package:bloodapp/Service/authgate.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer( const Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AuthGate()))
    );
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 56, 46),
      body: SafeArea(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //logo
              const Icon(Icons.water_drop,
              size: 100,
              color: Color.fromARGB(255, 251, 248, 248)
             ),
             SizedBox(height: 10,),
            Container(
              child: Text("Zindagi" ,style: TextStyle(color:Colors.white, fontSize: 30,fontWeight:FontWeight.bold),),
            ),
          ],),),),),

    );
  }
}