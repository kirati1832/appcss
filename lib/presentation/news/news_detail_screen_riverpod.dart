import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsDetailRiverpod extends ConsumerWidget {
  final dynamic news;
  final String? imageUrl;

  const NewsDetailRiverpod(
      {Key? key, required this.news, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? displayImage = imageUrl;
    String title = news['Title'] ?? 'ไม่มีชื่อเรื่อง';
    String type = news['type'] ?? 'ไม่ระบุประเภท';
    String postDate = news['PostDate'] ?? 'ไม่ระบุวันที่';
    String message = news['Message']?.replaceAll(RegExp(r'\s+'), ' ') ?? 'ไม่มีรายละเอียด';

    return Scaffold(
      appBar: AppBar(title: Text("รายละเอียดข่าว")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            if (displayImage != null && displayImage.isNotEmpty)
              Image.network(
                displayImage,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: Center(
                      child:
                          Icon(Icons.broken_image, color: Colors.red, size: 50),
                    ),
                  );
                },
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "📅 $postDate",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    message, // แสดงผลข้อความที่แก้ไขให้มีช่องว่างเดียว
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}