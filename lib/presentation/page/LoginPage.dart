import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appcsall/presentation/widget/widget.dart';
class Logins extends StatelessWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbars(),
        // Image.network('https://lh3.googleusercontent.com/proxy/Q7mRQExjKmP9DZ8IeHiXyCjwWvjJz9NOlDZu9xEQOq5dTFrDiHuYU-DmtLt8TYhnh028V99XDALD1BWsDhA',height: 80,),
        body: Stack(children: [
          // พื้นหลัง
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT03QFbf1m2wvFX7PRJEWoa4sLYUE-zCWjmLw&s'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // เอฟเฟกต์เบลอ + สีขาวขุ่น
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6), // ปรับค่าความเบลอ
              child: Container(
                color: Colors.white.withOpacity(0.001), // ปรับขาวขุ่น
              ),
            ),
          ),

          // เนื้อหา
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black, // เลือกสีที่ต้องการลบ
                    BlendMode.dstOut, // ซ่อนสีที่กำหนด
                  ),
                  child: Image.asset('assets/cislogo.png',
                      width: 100, height: 100), // หรือ Image.network()
                ),
                SizedBox(height: 20),
               
              ],
            ),
          ),
          Stack(
            children: [
              // ✅ พื้นหลังเต็มจอ
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/background.jpg'), // เปลี่ยนเป็นรูปพื้นหลังของคุณ
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ✅ Container ติดขอบล่าง เต็มความกว้าง
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity, // ✅ ให้เต็มจอ
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // ✅ สีขาวโปร่งแสง
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)), // ✅ มุมบนโค้ง
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // ✅ เงา
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ ข้อความ Welcome
                      Text(
                        "Welcome to",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 205, 33, 243)
                        ),
                      ),
                      Text(
                        "ComputerScience",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent
                        ),
                      ),
                      SizedBox(height: 10),

                      Image.network(
                        'https://www.itdikmutnb.com/images/newsweb2018/logo_kmutnb_final.png',
                        height: 28,
                      ),
                      /*Text(
                        "KMUTNB",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),*/
                      SizedBox(height: 20),
                      // ✅ ปุ่ม Login
                      Container(
                        width: double.infinity, // ✅ ปรับให้เต็มจอ
                        height: 40, // ✅ ความสูงของปุ่ม
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // ✅ ทำให้ปุ่มมน
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.purple
                            ], // ✅ ไล่สีจากฟ้าไปม่วง
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/logins');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // ✅ ทำให้ปุ่มโปร่งใส
                            shadowColor: Colors.transparent, // ✅ ลบเงา
                          ),
                          child: Text("LOGIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),

                      SizedBox(height: 10),

                      // ✅ ปุ่ม Register
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(color: Colors.blue),
                          ),
                          child: Text("REGISTER",
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
