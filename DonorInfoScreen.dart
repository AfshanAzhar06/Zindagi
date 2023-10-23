import 'package:flutter/material.dart';

class DonorInfoScreen extends StatefulWidget {
  final String donorInfo;
  final Function(String, String) onUpdate;

  DonorInfoScreen({required this.donorInfo, required this.onUpdate});

  @override
  _DonorInfoScreenState createState() => _DonorInfoScreenState();
}

class _DonorInfoScreenState extends State<DonorInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController lastDonationDateController = TextEditingController();
  String selectedBloodGroup = 'Select Blood Group'; // Default value

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

  bool isEditing = false;
  String originalDonorInfo = '';

  String editedName = '';
  String editedAddress = '';
  String editedContact = '';
  String editedLastDonationDate = '';

  @override
  void initState() {
    super.initState();
    originalDonorInfo = widget.donorInfo;
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;

      if (isEditing) {
        // Store the current values of the text fields
        editedName = nameController.text;
        editedAddress = addressController.text;
        editedContact = contactController.text;
        editedLastDonationDate = lastDonationDateController.text;
      } else {
        // Clear the text controllers when exiting editing mode
        nameController.clear();
        addressController.clear();
        contactController.clear();
        lastDonationDateController.clear();
      }
    });
  }

  void saveChanges() {
    final StringBuffer updatedInfo = StringBuffer();
    updatedInfo.write('Name: $editedName\n');
    updatedInfo.write('Address: $editedAddress\n');
    updatedInfo.write('Contact: $editedContact\n');
    updatedInfo.write('Last Donation Date: $editedLastDonationDate\n');

    if (selectedBloodGroup != 'Select Blood Group') {
      updatedInfo.write('Blood Group: $selectedBloodGroup');
    }

    widget.onUpdate(updatedInfo.toString(), selectedBloodGroup);
    toggleEditing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Donor Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isEditing)
              
                
               Padding(
  padding: EdgeInsets.only(top: 5.0, bottom: 200.0), // Adjust the padding as needed
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: originalDonorInfo.split('\n').map((line) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            line,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 12, 13, 14),
            ),
          ),
          SizedBox(height: 10.0), // Add space after each line
        ],
      );
    }).toList(),
  ),
)

            else
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    onChanged: (value) {
                      editedName = value;
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: addressController,
                    onChanged: (value) {
                      editedAddress = value;
                    },
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextField(
                    controller: contactController,
                    onChanged: (value) {
                      editedContact = value;
                    },
                    decoration: InputDecoration(labelText: 'Contact'),
                  ),
                  TextField(
                    controller: lastDonationDateController,
                    onChanged: (value) {
                      editedLastDonationDate = value;
                    },
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
                ],
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: isEditing ? saveChanges : toggleEditing,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(isEditing ? 'Save' : 'Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
