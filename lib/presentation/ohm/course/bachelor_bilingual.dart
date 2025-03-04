import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BachelorBilingual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "ปริญญาตรีโครงการสองภาษา",
        style: TextStyle(
            color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),
      )),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("หลักสูตรโครงการสองภาษา"),
            children: <Widget>[
              _buildCourse(
                title: 'หลักสูตรวิทยาศาสตรบัณฑิต โครงการสองภาษา',
                links: [
                  _CourseLink("ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/1_course_csb64.pdf"),
                  _CourseLink("การจัดการเรียนการสอน",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/2_course_csb64.pdf"),
                  _CourseLink(
                      "ประกาศ มจพ. เรื่อง หลักเกณฑ์การเบิกจ่ายเงินรายได้สำหรับหลักสูตรพิเศษระดับปริญญาตรี",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/4_course_csb64.pdf"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourse(
      {required String title, required List<_CourseLink> links}) {
    return ExpansionTile(
      title: Text(title),
      children: links.map((link) {
        return ListTile(
          title: Text(link.title),
          trailing: Icon(Icons.open_in_browser, color: Colors.blue),
          onTap: () async {
            Uri uri = Uri.parse(link.url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        );
      }).toList(),
    );
  }
}

class _CourseLink {
  final String title;
  final String url;
  _CourseLink(this.title, this.url);
}
