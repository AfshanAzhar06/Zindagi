import 'package:bloodapp/Screens/donors.dart';
import 'package:flutter/material.dart';

class DonorContainer extends StatelessWidget {
  final Donor donor;

  DonorContainer({required this.donor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${donor.name}'),
                      Text('Address: ${donor.address}'),
                      Text('Contact: ${donor.contact}'),
                      Text('Last Donation Date: ${donor.lastDonationDate}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Blood Group: ${donor.bloodGroup}',
                  style: TextStyle(backgroundColor: Color.fromARGB(255, 220, 68, 57)),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
