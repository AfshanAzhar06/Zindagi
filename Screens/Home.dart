import 'package:bloodapp/Screens/Adddonor.dart';
import 'package:bloodapp/Screens/donors.dart';
import 'package:bloodapp/Screens/logoutpage.dart';
import 'package:bloodapp/Service/ShowAllDonars.dart';
import 'package:bloodapp/Service/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
void signOut() {
  // Get auth service
  final authServices = Provider.of<AuthServices>(context, listen: false);
  authServices.signOut();
}
  List<Donor> donors = []; // Initialize an empty list of donors
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle), // Replace with your profile icon
            onPressed: () {
               Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const logout(), // Pass the callback
      ),
    );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0, // Fix to the top of the screen
            left: 0, // Fix to the left of the screen
            right: 0, // Fix to the right of the screen
            child: Image.asset(
              'lib/assets/map.jpeg', // Replace with your asset image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 300), // Add space between image and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BloodGroupButton('A+'),
                  BloodGroupButton('A-'),
                  BloodGroupButton('B+'),
                  BloodGroupButton('B-'),
                  BloodGroupButton('AB+'),
                 
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.0,),
                  BloodGroupButton('AB-'),
                  SizedBox(width: 20.0,),
                  BloodGroupButton('O+'),
                  SizedBox(width: 20.0,),
                  BloodGroupButton('All'),]),
              SizedBox(height: 20), // Add space between buttons and bottom buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowAllDonars()),
                      );
                    
                    },
                    style: ElevatedButton.styleFrom(
        primary: Colors.red, // Change the filled color to blue
        onPrimary: Colors.white, // Change the text color to white
        minimumSize: Size(50, 40), // Change the button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Change the border radius
          side: BorderSide(color: Color.fromARGB(255, 157, 47, 14)), // Change the border color
        ),
      ),
                    child: Text('Show All'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddDonorScreen(onAddDonor: (Donor ) {  },)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
        primary: Colors.red, // Change the filled color to blue
        onPrimary: Colors.white, // Change the text color to white
        minimumSize: Size(50, 40), // Change the button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Change the border radius
          side: BorderSide(color: Color.fromARGB(255, 157, 47, 14)), // Change the border color
        ),
      ),
                    child: Text('Add New Donor'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      
    );
    
  }
  
}

class BloodGroupButton extends StatelessWidget {
  final String bloodGroup;

  BloodGroupButton(this.bloodGroup);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add action for the blood group button
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 241, 242, 244), // Change the filled color to blue
        onPrimary: Color.fromARGB(255, 147, 20, 20), // Change the text color to white
        minimumSize: Size(5, 25), // Change the button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Change the border radius
          side: BorderSide(color: const Color.fromARGB(255, 243, 82, 33)), // Change the border color
        ),
      ),
      child: Text(bloodGroup),
    );
    
  }
}