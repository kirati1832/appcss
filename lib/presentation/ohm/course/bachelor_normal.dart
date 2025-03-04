import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BachelorNormal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "ปริญญาตรีภาคปกติ",
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
                    'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2564)',
                links: [
                  _CourseLink("หมวดที่ 1 ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor1.pdf"),
                  _CourseLink("หมวดที่ 2 ข้อมูลเฉพาะของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor2.pdf"),
                  _CourseLink(
                      "หมวดที่ 3 ระบบการจัดการศึกษา การดำเนินการ และโครงสร้างของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor3.pdf"),
                  _CourseLink(
                      "หมวดที่ 4 ผลการเรียนรู้ กลยุทธ์การสอนและการประเมินผล",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor4_update.pdf"),
                  _CourseLink("หมวดที่ 5 หลักเกณฑ์ในการประเมินผลนักศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor5.pdf"),
                  _CourseLink("หมวดที่ 6 การพัฒนาคณาจารย์",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor6.pdf"),
                  _CourseLink("หมวดที่ 7 การประกันคุณภาพหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor7.pdf"),
                  _CourseLink(
                      "หมวดที่ 8 การประเมินและปรับปรุงการดำเนินการของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor8.pdf"),
                  _CourseLink("แผนภูมิแสดงความต่อเนื่องของการศึกษาในหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/appendixbcs2564.pdf"),
                  _CourseLink("คำอธิบายรายวิชา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_subjects.pdf"),
                ],
              ),
              _buildCourse(
                title:
                    'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2559)',
                links: [
                  _CourseLink("หมวดที่ 1 ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_CS59_1.pdf"),
                  _CourseLink("หมวดที่ 2 ข้อมูลเฉพาะของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_2.pdf"),
                  _CourseLink(
                      "หมวดที่ 3 ระบบการจัดการศึกษา การดำเนินการ และโครงสร้างของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_3.pdf"),
                  _CourseLink(
                      "หมวดที่ 4 ผลการเรียนรู้ กลยุทธ์การสอนและการประเมินผล",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_4.pdf"),
                  _CourseLink("หมวดที่ 5 หลักเกณฑ์ในการประเมินผลนักศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_5.pdf"),
                  _CourseLink("หมวดที่ 6-7 การพัฒนาคณาจารย์และการประกันคุณภาพ",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_6_7.pdf"),
                  _CourseLink(
                      "หมวดที่ 8 การประเมินและปรับปรุงการดำเนินการของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_8.pdf"),
                  _CourseLink("คำอธิบายรายวิชา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_bachelor_cs59_subjects.pdf"),
                ],
              ),
              _buildCourse(
                  title:
                      'การปรับปรุงแก้ไขหลักสูตร(หลักสูตรวิทยาศาสตรบัณฑิตปี 2559)',
                  links: [
                    _CourseLink(
                        'การปรับปรุงแก้ไขหลักสูตรวิทยาศาสตรบัณฑิตปี 2559',
                        'http://202.44.40.179/DATA_From_chiab/Image/pdf/course_edit2559.pdf')
                  ])
            ],
          ),
          ExpansionTile(
            title: Text("หลักสูตรเก่า"),
            children: <Widget>[
              _buildCourse(
                title:
                    'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2554)',
                links: [
                  _CourseLink("หมวดที่ 1 ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bsc54-1.pdf"),
                  _CourseLink("หมวดที่ 2 ข้อมูลเฉพาะของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bsc54-2.pdf"),
                  _CourseLink(
                      "หมวดที่ 3 ระบบการจัดการศึกษา การดำเนินการ และโครงสร้างของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bsc54-3.pdf"),
                  _CourseLink(
                      "หมวดที่ 4 ผลการเรียนรู้ กลยุทธ์การสอนและการประเมินผล",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bsc54-4.pdf"),
                  _CourseLink("หมวดที่ 5 หลักเกณฑ์ในการประเมินผลนักศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bcs54-5.pdf"),
                  _CourseLink("คำอธิบายรายวิชา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/bsc54_subjects.pdf"),
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
