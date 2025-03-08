import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      'name': 'ธีราพัฒน์ จิรภาสนิธิเลิศ',
      'ID': '6504062610137',
      'role': 'Project Manager'
    },
    {
      'name': 'กีรติ บุญเทศ',
      'ID': '6504062610048',
      'role': 'Frontend Developer'
    },
    {
      'name': 'ศิวกร ตันติโรจน์',
      'ID': '6504062610277',
      'role': 'Frontend Developer'
    },
    {
      'name': 'วรวิทย์ กิมเฮงหลี',
      'ID': '6504062610226',
      'role': 'Backend Developer'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:  Colors.lightBlue,
        elevation: 0,
        title: Text(
          'ทีมงานพัฒนา',
          style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 236, 233, 233), // Background color for the body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white, // Background color for the Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading:
                      Icon(Icons.person, size: 40, color: Colors.blueAccent),
                  title: Text(
                    teamMembers[index]['name']!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue), // Text color for the name
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${teamMembers[index]['ID']!}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue), // Text color for the ID
                      ),
                      Text(
                        'Role: ${teamMembers[index]['role']!}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue), // Text color for the role
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CreditsPage(),
  ));
}
