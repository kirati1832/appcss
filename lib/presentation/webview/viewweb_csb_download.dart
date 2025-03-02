import 'package:flutter/material.dart';
import '../page/url.dart'; // นำเข้าไฟล์ที่มีคลาส Url

class webview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      body: Center(
        child: Column(
          children: [
              ElevatedButton(
                onPressed: () {
                  // URL ที่ต้องการเปิด
                  String websiteUrl = 'http://cs.kmutnb.ac.th/csb.jsp';
                  
                  // ส่งไปยังหน้าที่มี WebView
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Url(url: websiteUrl),
                    ),
                  );
                },
                child: Text('csb'),
              ),
              ElevatedButton(
                onPressed: () {
                  // URL ที่ต้องการเปิด
                  String websiteUrl = 'http://cs.kmutnb.ac.th/student_download.jsp';
                  
                  // ส่งไปยังหน้าที่มี WebView
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Url(url: websiteUrl),
                    ),
                  );
                },
                child: Text('ดาวโหลดนักศึกษา'),
              ),ElevatedButton(
                onPressed: () {
                  // URL ที่ต้องการเปิด
                  String websiteUrl = 'http://cs.kmutnb.ac.th/staff_download.jsp';
                  
                  // ส่งไปยังหน้าที่มี WebView
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Url(url: websiteUrl),
                    ),
                  );
                },
                child: Text('ดาวโหลดบุคลากร'),
              ),
        
          ],
        ),
      ),
    );
  }
}
