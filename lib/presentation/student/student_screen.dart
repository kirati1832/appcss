import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../page/url.dart';
import '../../../bottom_navbar.dart';
import 'student_advisors_screen.dart';
import 'package:appcsall/provider/bottomnavbarprovider.dart';
class StudentScreen extends ConsumerStatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends ConsumerState<StudentScreen> {
  int _currentIndex = 1;

  Future<List<dynamic>> fetchCourseData() async {
    final url =
        Uri.parse('http://202.44.40.179/Data_From_Chiab/json/courseData.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodedData = json.decode(utf8.decode(response.bodyBytes));
        if (decodedData is List) {
          return decodedData;
        } else {
          throw Exception('Unexpected JSON format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'แบบฟอร์มดาวน์โหลด',
      'route': '/student-forms',
      'icon': Icons.download
    },
    {'title': 'คู่มือนักศึกษา', 'route': '/student-guide', 'icon': Icons.book},
    {'title': 'อาจารย์ที่ปรึกษา', 'route': '/advisors', 'icon': Icons.people},
    {'title': 'Link นักศึกษา', 'route': '/studentlink', 'icon': Icons.link},
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navigationIndexProvider);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'หลักสูตร',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                FutureBuilder<List<dynamic>>(
                  future: fetchCourseData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available'));
                    }

                    List<dynamic> courses = snapshot.data!;

                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: courses.map((course) {
                        String imageUrl = course['imageUrl'] ?? '';
                        String courseTitle = course['courseTitle'] ?? '';

                        if (!imageUrl.startsWith('http')) {
                          imageUrl = 'http://' + imageUrl;
                        }
                        return GestureDetector(
                          onTap: () async {
                            final urls = course['url'];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Url(url: urls),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      color: Colors.grey,
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    color: Colors.black.withOpacity(0.6),
                                    child: Text(
                                      courseTitle,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                SizedBox(height: 12),
              ],
            ),
          ),

          // ✅ Grid Menu with Navigation
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: menuItems.map((menu) {
                  return ElevatedButton(
                    onPressed: () {
                      switch (menu['title']) {
                        case 'แบบฟอร์มดาวน์โหลด':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Url(
                                  url:
                                      'http://cs.kmutnb.ac.th/student_download.jsp'),
                            ),
                          );
                          break;
                        case 'คู่มือนักศึกษา':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Url(
                                  url: 'http://cs.kmutnb.ac.th/guide-step.jsp'),
                            ),
                          );
                          break;
                        case 'อาจารย์ที่ปรึกษา':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentAdvisorsScreen(),
                            ),
                          );
                          break;
                        case 'Link นักศึกษา':
                          Navigator.pushNamed(context,'/studentlink');
                          break;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          menu['icon'],
                          color: Colors.orange[800],
                          size: 60.0,
                        ),
                        SizedBox(
                            height: 8), // เพิ่มระยะห่างระหว่าง Icon กับ Text
                        Text(
                          menu['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
       bottomNavigationBar: BottomNavbar(
        onTap: (index) {
          if (currentIndex == index) return;
          ref.read(navigationIndexProvider.notifier).updateIndex(index);
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/news');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/student');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/staff');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/submenu');
              break;
          }
        },
      ),
    );
  }
}
