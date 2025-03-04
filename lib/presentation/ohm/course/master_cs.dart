import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MasterCS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "ปริญญาโท สาขาวิชาวิทยาการคอมพิวเตอร์",
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
                    'หลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2567)',
                links: [
                  _CourseLink("องค์ประกอบที่ 1 ชื่อปริญญาและสาขาวิชา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs1_67.pdf"),
                  _CourseLink(
                      "องค์ประกอบที่ 2 ปรัชญา วัตถุประสงค์ ผลลัพธ์การเรียนรู้",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs2_67.pdf"),
                  _CourseLink(
                      "องค์ประกอบที่ 3 โครงสร้างหลักสูตร รายวิชาและหน่วยกิต",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs3_67.pdf"),
                  _CourseLink("องค์ประกอบที่ 4 การจัดกระบวนการเรียนรู้",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs4_67.pdf"),
                  _CourseLink(
                      "องค์ประกอบที่ 5 ความพร้อมและศักยภาพในการบริหารจัดการหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs5_67.pdf"),
                  _CourseLink("องค์ประกอบที่ 6 คุณสมบัติของผู้เข้าศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs6_67.pdf"),
                  _CourseLink(
                      "องค์ประกอบที่ 7 การประเมินผลการเรียนและเกณฑ์การสำเร็จการศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs7_67.pdf"),
                  _CourseLink("องค์ประกอบที่ 8 การประกันคุณภาพหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs8_67.pdf"),
                  _CourseLink("องค์ประกอบที่ 9 ระบบและกลไกในการพัฒนาหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs9_67.pdf"),
                  _CourseLink("ภาคผนวก",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/appendix_67.pdf"),
                ],
              ),
              _buildCourse(
                title:
                    'หลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (หลักสูตรปรับปรุง พ.ศ. 2562)',
                links: [
                  _CourseLink("หมวดที่ 1 ข้อมูลทั่วไป",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs1.pdf"),
                  _CourseLink("หมวดที่ 2 ข้อมูลเฉพาะของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs2.pdf"),
                  _CourseLink(
                      "หมวดที่ 3 ระบบการจัดการศึกษา การดำเนินการ และโครงสร้างของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs3.pdf"),
                  _CourseLink(
                      "หมวดที่ 4 ผลการเรียนรู้ กลยุทธ์การสอนและการประเมินผล",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs4.pdf"),
                  _CourseLink("หมวดที่ 5 หลักเกณฑ์ในการประเมินผลนักศึกษา",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs5.pdf"),
                  _CourseLink("หมวดที่ 6 การพัฒนาคณาจารย์",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs6.pdf"),
                  _CourseLink("หมวดที่ 7 การประกันคุณภาพหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs7.pdf"),
                  _CourseLink(
                      "หมวดที่ 8 การประเมินและปรับปรุงการดำเนินการของหลักสูตร",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs8.pdf"),
                  _CourseLink("ภาคผนวก",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_ms_cs9.pdf"),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text("การปรับปรุงแก้ไขหลักสูตร"),
            children: <Widget>[
              _buildCourse(
                title: 'การปรับปรุงแก้ไขหลักสูตรวิทยาศาสตรมหาบัณฑิตปี 2562',
                links: [
                  _CourseLink("รายละเอียดการปรับปรุง",
                      "http://202.44.40.179/DATA_From_chiab/Image/pdf/course_editcs2562.pdf"),
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
