import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../bottom_navbar.dart';

import 'student_advisors_screen.dart';
import 'student_forms_screen.dart';
import 'student_guide_screen.dart';


// Import ไฟล์หลักสูตร
import 'package:appcsall/presentation/ohm/course/bachelor_normal.dart';
import 'package:appcsall/presentation/ohm/course/bachelor_bilingual.dart';
import 'package:appcsall/presentation/ohm/course/master_cs.dart';
import 'package:appcsall/presentation/ohm/course/master_se.dart';
import 'package:appcsall/presentation/ohm/course/phd.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final List<Map<String, dynamic>> courseData = [
    {
      'imageUrl': 'http://202.44.40.179/DATA_From_chiab/Image/img/course2.jpg',
      'courseTitle': 'ปริญญาตรี ภาคปกติ',
      'courseWidget': BachelorNormal(),
      'courseDescription':
          'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์(ปริญญาตรี ภาคปกติ) Bachelor of Science Program in Computer Science',
    },
    {
      'imageUrl': 'http://202.44.40.179/DATA_From_chiab/Image/img/course4.jpg',
      'courseTitle': 'ปริญญาตรี โครงการพิเศษ สองภาษา',
      'courseWidget': BachelorBilingual(),
      'courseDescription':
          'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์(ปริญญาตรี โครงการพิเศษ สองภาษา) Bachelor of Science Program in Computer Science',
    },
    {
      'imageUrl': 'http://202.44.40.179/DATA_From_chiab/Image/img/course6.jpg',
      'courseTitle': 'ปริญญาโท สาขาวิชาวิทยาการคอมพิวเตอร์',
      'courseWidget': MasterCS(),
      'courseDescription':
          'หลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (ปริญญาโท) Master of Science Program in Computer Science',
    },
    {
      'imageUrl': 'http://202.44.40.179/DATA_From_chiab/Image/img/course1.jpg',
      'courseTitle': 'ปริญญาโท สาขาวิศวกรรมซอฟต์แวร์',
      'courseWidget': MasterSE(),
      'courseDescription':
          'หลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิศวกรรมซอฟต์แวร์ (ปริญญาโท) Master of Science Program in Software Engineering',
    },
    {
      'imageUrl': 'http://202.44.40.179/DATA_From_chiab/Image/img/course7.jpg',
      'courseTitle': 'ปริญญาเอก',
      'courseWidget': PhD(),
      'courseDescription':
          'หลักสูตรปรัชญาดุษฎีบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์(ปริญญาเอก) Doctor of Philosophy Program in Computer Science',
    },
  ];
  int _currentIndex = 1;

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'แบบฟอร์มดาวน์โหลด',
      'route': '/student-forms',
      'icon': Icons.download
    },
    {'title': 'คู่มือนักศึกษา', 'route': '/student-guide', 'icon': Icons.book},
    {'title': 'อาจารย์ที่ปรึกษา', 'route': '/advisors', 'icon': Icons.people},
    {'title': 'Link นักศึกษา', 'route': '/student-links', 'icon': Icons.link},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        title: Text('นักศึกษา',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'หลักสูตร',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              //Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: courseData.map((course) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the CourseList screen with the course type
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => course['courseWidget'],
                          ));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.network(
                              course['imageUrl'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    width: 300,
                                    height: 250,
                                    color: Colors.grey[300],
                                    child:
                                        Icon(Icons.error, color: Colors.red));
                              },
                            ),

                            //ข้อความ
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: Colors.black.withOpacity(0.6),
                                child: Column(
                                  children: [
                                    Text(
                                      course['courseTitle'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      course['courseDescription'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                }).toList(),
              ),
              SizedBox(height: 12),
            ]),
          ),
          //Grid Menu with Navigation
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: menuItems.map((menu) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      //route to menu title
                      switch (menu['title']) {
                        case 'แบบฟอร์มดาวน์โหลด':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentFormScreen()));
                          break;
                        case 'คู่มือนักศึกษา':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentGuideScreen()));
                          break;
                        case 'อาจารย์ที่ปรึกษา':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentAdvisorsScreen()));
                          break;
                        /*case 'Link นักศึกษา':
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentLinkScreen()));
                          break;*/
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(
                      menu['icon'],
                      color: Colors.orange[800],
                      size: 30.0,
                    ),
                    label: Text(
                      menu['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/news');
                break;
              case 1:
                //Navigator.pushNamed(context, '/student'); //you don't need to navigate again
                break;
              case 2:
                Navigator.pushNamed(context, '/home');
                break;
              case 3:
                Navigator.pushNamed(context, '/staff');
                break;
              case 4:
                Navigator.pushNamed(context, '/contact');
                break;
            }
          }),
    );
  }
}
