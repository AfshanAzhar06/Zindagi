
import 'package:bloodapp/Screens/loginpage.dart';
import 'package:flutter/material.dart';

class logout extends StatelessWidget {
  const logout({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 249, 249),
       body: SafeArea(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              

              //logo
              const Icon(Icons.water_drop,
              size: 100,
              color: Colors.red
             ),
             SizedBox(height: 10,),
            Container(
              child: Text("Zindagi" ,style: TextStyle(color:Colors.red,fontSize: 30,fontWeight:FontWeight.bold),),
            ),
            SizedBox(height:20.0),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInPage(onTap: () {  },), // Pass the callback
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.red,
  ),
  child: Text('Logout'),
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
