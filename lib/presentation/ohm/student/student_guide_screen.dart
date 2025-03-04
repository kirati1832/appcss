import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentGuideScreen extends StatelessWidget {
  StudentGuideScreen({super.key});

  final List<Map<String, dynamic>> guideLinks = [
    {
      'title': 'คู่มือการลงทะเบียน',
      'url':
          'http://202.44.40.179/DATA_From_chiab/Image/pdf/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%81%e0%b8%b2%e0%b8%a3%e0%b8%a5%e0%b8%87%e0%b8%97%e0%b8%b0%e0%b9%80%e0%b8%9a%e0%b8%b5%e0%b8%a2%e0%b8%99.pdf'
    },
    {'title': 'คู่มือนักศึกษา ปี 2567', 'url': ''},
    {'title': 'คู่มือนักศึกษา ปี 2566', 'url': ''},
    {
      'title': 'คู่มือนักศึกษา ปี 2565',
      'url':
          'http://202.44.40.179/DATA_From_chiab/Image/pdf/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2%e0%b8%9b%e0%b8%b52565.pdf'
    },
    {
      'title': 'คู่มือนักศึกษา ปี 2564',
      'url':
          'http://202.44.40.179/DATA_From_chiab/Image/pdf/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2%20%e0%b8%9b%e0%b8%b5%202564.pdf'
    },
    {
      'title': 'คู่มือนักศึกษา ปี 2563',
      'url':
          'http://202.44.40.179/DATA_From_chiab/Image/pdf/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2/%e0%b8%84%e0%b8%b9%e0%b9%88%e0%b8%a1%e0%b8%b7%e0%b8%ad%e0%b8%99%e0%b8%b1%e0%b8%81%e0%b8%a8%e0%b8%b6%e0%b8%81%e0%b8%a9%e0%b8%b2%20%e0%b8%9b%e0%b8%b5%202563.pdf'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'คู่มือนักศึกษา',
          style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: guideLinks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(guideLinks[index]['title']!),
              onTap: () async {
                final url = guideLinks[index]['url'];
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          );
        },
      ),
    );
  }
}
