import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "ปริญญาเอก",
        style: TextStyle(
            color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),
      )),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("หลักสูตรปัจจุบัน"),
            children: <Widget>[
              _buildCourse(
                title:
                    'หลักสูตรปรัชญาดุษฎีบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2564)',
                links: [
                  _CourseLink("หมวดที่ 1 ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd1.pdf"),
                  _CourseLink("หมวดที่ 2 ข้อมูลเฉพาะของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd2.pdf"),
                  _CourseLink(
                      "หมวดที่ 3 ระบบการจัดการศึกษา การดำเนินการ และโครงสร้างของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd3.pdf"),
                  _CourseLink(
                      "หมวดที่ 4 ผลการเรียนรู้ กลยุทธ์การสอนและการประเมินผล",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd4.pdf"),
                  _CourseLink("หมวดที่ 5 หลักเกณฑ์ในการประเมินผลนักศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd5.pdf"),
                  _CourseLink("หมวดที่ 6 การพัฒนาคณาจารย์",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd6.pdf"),
                  _CourseLink("หมวดที่ 7 การประกันคุณภาพหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd7.pdf"),
                  _CourseLink(
                      "หมวดที่ 8 การประเมินและปรับปรุงการดำเนินการของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course-phd8.pdf"),
                  _CourseLink("ภาคผนวก",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/appendix-phd.pdf"),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text("การปรับปรุงแก้ไขหลักสูตร"),
            children: <Widget>[
              _buildCourse(
                title: 'การปรับปรุงแก้ไขหลักสูตรปรัชญาดุษฎีบัณฑิตปี 2559',
                links: [
                  _CourseLink("รายละเอียดการปรับปรุง",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_edit2559.pdf"),
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
