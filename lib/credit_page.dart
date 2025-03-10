import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'ธีราพัฒน์ จิรภาสนิธิเลิศ', 'ID': '6504062610137', 'role': 'Project Manager'},
    {'name': 'กีรติ บุญเทศ', 'ID': '6504062610048', 'role': 'Frontend Developer'},
    {'name': 'ศิวกร ตันติโรจน์', 'ID': '6504062610277', 'role': 'Frontend Developer'},
    {'name': 'วรวิทย์ กิมเฮงหลี', 'ID': '6504062610226', 'role': 'Backend Developer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทีมงานพัฒนา', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
            /// ✅ รายชื่อทีมงาน
            Expanded(
              child: ListView.builder(
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  return _buildTeamMemberCard(teamMembers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ ฟังก์ชันสร้าง UI สำหรับแต่ละทีม
  Widget _buildTeamMemberCard(Map<String, String> member) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          /// ✅ ไอคอนโปรไฟล์
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueAccent.shade100,
            child: Icon(Icons.person, size: 30, color: Colors.white),
          ),
          SizedBox(width: 12),

          /// ✅ ข้อมูลทีมงาน
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                SizedBox(height: 4),
                Text("ID: ${member['ID']!}", style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text("Role: ${member['role']!}", style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CreditsPage()));
}
