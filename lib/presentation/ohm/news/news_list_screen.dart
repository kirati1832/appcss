import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bottom_navbar.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<dynamic> newsList = []; // เก็บข้อมูล JSON
  final List<String> categories = [
    "ทั้งหมด",
    "ข่าวภาควิชา",
    "ข่าวคณะและมหาวิทยาลัย",
    "ข่าวทุนการศึกษา",
    "ข่าวรับสมัครงาน-ประชาสัมพันธ์"
  ];
  int selectedCategoryIndex = 0;
  int _currentIndex = 0;

  Future<void> fetchNews() async {
    final url =
        Uri.parse('http://202.44.40.179:3000/posts'); // เปลี่ยน URL ตามที่ใช้
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        newsList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews(); // โหลดข้อมูลเมื่อเปิดหน้า
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredNews = newsList
        .where((news) => news['type'] == categories[selectedCategoryIndex])
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text("ข่าวสาร")),
      body: Column(
        children: [
          // Scrollable Navbar with selectable categories
          Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: selectedCategoryIndex == index
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ),
          Expanded(
            child: newsList.isEmpty
                ? Center(child: CircularProgressIndicator()) // แสดงโหลดข้อมูล
                : ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      var news = newsList[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // รูปภาพข่าว
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: Image.network(
                                news['img_url'],
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 180,
                                    color: Colors.grey[300],
                                    child: Center(
                                        child: Icon(Icons.error,
                                            color: Colors.red)),
                                  );
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // หัวข้อข่าว
                                  Text(
                                    news['Title'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  // วันที่โพสต์
                                  Text(
                                    "📅 ${news['PostDate']}",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  SizedBox(height: 5),
                                  // ประเภทข่าว
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      news['type'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                //Navigator.pushNamed(context, '/news');
                break;
              case 1:
                Navigator.pushNamed(context, '/student');
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
