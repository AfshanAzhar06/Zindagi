import 'package:bloodapp/DonorInfoScreen.dart';
import 'package:flutter/material.dart';

class ShowAllDonars extends StatefulWidget {
  @override
  _ShowAllDonarsState createState() => _ShowAllDonarsState();
}

class _ShowAllDonarsState extends State<ShowAllDonars> {
  List<String> containerData = [
    'Information for Donor 0',
    'Information for Donor 1',
    'Information for donor 2',
    'Information for donor 3',
    'Information for Donor 3',
    'Information for Donor 4',
    'Information for Donor 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('All Donors'),
      ),
      body: Center(
        child: VerticalContainerList(
          containerData: containerData,
          onUpdate: updateData,
        ),
      ),
    );
  }

  void updateData(int index, String updatedInfo) {
    setState(() {
      containerData[index] = updatedInfo;
    });
  }
}

class VerticalContainerList extends StatelessWidget {
  final List<String> containerData;
  final Function(int, String) onUpdate;

  VerticalContainerList({
    required this.containerData,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: containerData.length,
      itemBuilder: (BuildContext context, int index) {
        final donorInfo = containerData[index];
final bloodGroupMatch = RegExp(r'Blood Group: (\w+\s*[+-])').firstMatch(donorInfo);
        final bloodGroup = bloodGroupMatch != null ? bloodGroupMatch.group(1) : null;
        final donorInfoWithoutBloodGroup = donorInfo.replaceAll(bloodGroupMatch?.group(0) ?? '', '');

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DonorInfoScreen(
                  donorInfo: donorInfoWithoutBloodGroup,
                  onUpdate: (updatedInfo, selectedBloodGroup) {
                    onUpdate(index, updatedInfo);
                    // ignore: unnecessary_null_comparison
                    // final updatedDonorInfo = selectedBloodGroup != null
                    //     ? '$updatedInfo\nBlood Group: $selectedBloodGroup'
                    //     : updatedInfo;
                    // containerData[index] = updatedDonorInfo;
                  },
                ),
              ),
            );
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(donorInfoWithoutBloodGroup),
                      ),
                    ),
                    if (bloodGroupMatch != null)

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('  $bloodGroup    ',style: TextStyle(backgroundColor: const Color.fromARGB(255, 220, 68, 57)),),
                      ),
                  ],
                ),
                Divider(), // Add a divider between items
              ],
            ),
          ),
        );
      },
    );
  }
}


