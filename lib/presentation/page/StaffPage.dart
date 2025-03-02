import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:appcsall/data/staffdata.dart';
// ✅ Import หน้า WebView
import 'stafflinkpage.dart'; // ✅ Import หน้า Link Page
/// โหลดรูปจาก URL แล้วแปลงเป็น Uint8List
Future<Uint8List> loadImage(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  } catch (e) {
    throw Exception('Error loading image: $e');
  }
}

class PersonnelScreen extends StatefulWidget {
  const PersonnelScreen({super.key});

  @override
  State<PersonnelScreen> createState() => _PersonnelScreenState();
}

class _PersonnelScreenState extends State<PersonnelScreen> {
  String selectedCategory = "อาจารย์";
  final List<String> categories = [
    "อาจารย์",
    "ผู้บริหารภาค",
    "บุคลากรสนับสนุน",
    "📂 แบบฟอร์มดาวน์โหลด",
    "🔗 Link สำหรับบุคลากร"
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> currentList =
        personnelData[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("บุคลากร"),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          /// **ปุ่มเลือกหมวดหมู่**
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  bool isSelected = selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      if (category == "📂 แบบฟอร์มดาวน์โหลด") {
                        
                      } else if (category == "🔗 Link สำหรับบุคลากร") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LinkPage()),
                        );
                      } else {
                        setState(() {
                          selectedCategory = category;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  isSelected ? Colors.blueAccent : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (isSelected)
                            Container(
                              height: 3,
                              width: 40,
                              color: Colors.blueAccent,
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          /// **แสดงข้อมูลบุคลากรเป็น Grid**
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // แสดงเป็น 2 คอลัมน์
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // **เพิ่มความสูงของการ์ด**
                ),
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  var person = currentList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonnelDetailScreen(person),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.blue.shade800,
                      child: Column(
                        children: [
                          /// **ใช้ FutureBuilder โหลดรูป**
                          Hero(
                            tag: person["name"]!,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: FutureBuilder<Uint8List>(
                                future: loadImage(person["image"]!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      height: 180, // **ขยายรูปให้ใหญ่ขึ้น**
                                      width: double.infinity,
                                      color: Colors.grey.shade300,
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  } else if (snapshot.hasError ||
                                      snapshot.data!.isEmpty) {
                                    return Container(
                                      height: 180,
                                      width: double.infinity,
                                      color: Colors.grey.shade300,
                                      child: const Icon(
                                        Icons.broken_image,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    );
                                  }
                                  return Image.memory(snapshot.data!,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              person["name"]?.split(' ')?.first ??
                                  'ไม่มีข้อมูล',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonnelDetailScreen extends StatefulWidget {
  final Map<String, String> person;

  const PersonnelDetailScreen(this.person, {super.key});

  @override
  State<PersonnelDetailScreen> createState() => _PersonnelDetailScreenState();
}

class _PersonnelDetailScreenState extends State<PersonnelDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    List<String> educationList = widget.person["education"]!.split("|");
    List<String> researchList = widget.person["research"]!.split("|");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// **รูปภาพบุคลากร**
            Stack(
              children: [
                /// **พื้นหลังสีขาวเรียบ**
                Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.white,
                ),

                /// **แสดงรูปภาพบุคลากร**
                Hero(
                  tag: widget.person["name"]!,
                  child: FutureBuilder<Uint8List>(
                    future: loadImage(widget.person["image"]!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return _buildLoadingImage();
                      } else if (snapshot.hasError || snapshot.data!.isEmpty) {
                        return _buildErrorImage();
                      }
                      return ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20)),
                        child: Image.memory(
                          snapshot.data!,
                          width: double.infinity,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                /// **ปุ่มย้อนกลับ**
                Positioned(
                  top: 15,
                  left: 15,
                  child: _buildCircleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                ),

                /// **ปุ่ม Favorite**
                Positioned(
                  top: 15,
                  right: 15,
                  child: _buildCircleButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    iconColor: Colors.red,
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),

            /// **รายละเอียดบุคลากร**
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// **ชื่อบุคลากร**
                    Text(
                      widget.person["name"]!,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.person["english_name"]!,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 15),

                    /// **ข้อมูลติดต่อ**
                    _buildInfoCard(
                      icon: Icons.email,
                      text: widget.person["email"]!,
                      color: Colors.orange,
                    ),
                    if (widget.person["phone"] != "")
                      _buildInfoCard(
                        icon: Icons.phone,
                        text: widget.person["phone"]!,
                        color: Colors.green,
                      ),

                    const SizedBox(height: 25),

                    /// **วุฒิการศึกษา**
                    if (educationList[0] != "") ...[
                      _buildSectionTitle("📘 วุฒิการศึกษา"),
                      ...educationList.map((edu) =>
                          _buildListTile(Icons.school, edu, Colors.blue)),
                    ],

                    const SizedBox(height: 25),

                    /// **ผลงานวิชาการ**
                    if (researchList[0] != "") ...[
                      _buildSectionTitle("📑 ผลงานทางวิชาการ"),
                      ...researchList.map((res) =>
                          _buildListTile(Icons.book, res, Colors.purple)),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **ปุ่มกลม (Back & Favorite)**
  Widget _buildCircleButton(
      {required IconData icon, Color? iconColor, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 24,
        child: Icon(icon, color: iconColor ?? Colors.black, size: 26),
      ),
    );
  }

  /// **รูปภาพ Loading**
  Widget _buildLoadingImage() {
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.grey.shade300,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  /// **รูปภาพ Error**
  Widget _buildErrorImage() {
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.grey.shade300,
      child: const Icon(Icons.broken_image, size: 100, color: Colors.grey),
    );
  }

  /// **การ์ดข้อมูลติดต่อ**
  Widget _buildInfoCard(
      {required IconData icon, required String text, required Color color}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  /// **หัวข้อแต่ละหมวด**
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// **รายการข้อมูล**
  Widget _buildListTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
