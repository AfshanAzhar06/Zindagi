import 'package:bloodapp/Screens/donors.dart';
import 'package:flutter/material.dart';

class AddDonorScreen extends StatefulWidget {
  final Function(Donor) onAddDonor;

  AddDonorScreen({required this.onAddDonor});

  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController lastDonationDateController = TextEditingController();
  String selectedBloodGroup = 'Select Blood Group';

  final List<String> bloodGroups = [
    'Select Blood Group',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  void addDonor() {
    if (selectedBloodGroup != 'Select Blood Group') {
      final newDonor = Donor(
        name: nameController.text,
        address: addressController.text,
        contact: contactController.text,
        lastDonationDate: lastDonationDateController.text,
        bloodGroup: selectedBloodGroup,
      );

      widget.onAddDonor(newDonor);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Add New Donor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact'),
            ),
            TextField(
              controller: lastDonationDateController,
              decoration: InputDecoration(labelText: 'Last Donation Date'),
            ),
            DropdownButton<String>(
              value: selectedBloodGroup,
              items: bloodGroups.map((String group) {
                return DropdownMenuItem<String>(
                  value: group,
                  child: Text(group),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedBloodGroup = newValue ?? 'Select Blood Group';
                });
              },
            ),
            ElevatedButton(
              onPressed: addDonor,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Add Donor'),
            ),
          ],
        ),
      ),
    );
  }
}
