import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/no-internet.json', // ✅ ใช้ไฟล์แอนิเมชัน
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "ไม่มีการเชื่อมต่ออินเทอร์เน็ต",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "กรุณาตรวจสอบการเชื่อมต่อและลองใหม่อีกครั้ง",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _checkConnectivity(context),
              icon: Icon(Icons.refresh,color: Colors.white,),
              label: Text("ลองอีกครั้ง",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.deepPurple, // เปลี่ยนสีปุ่ม
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _checkConnectivity(BuildContext context) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult != ConnectivityResult.none) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // ปิดหน้าถ้ามีหน้าอื่นอยู่
    }
  }
}
}