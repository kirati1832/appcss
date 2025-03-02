import 'package:appcsall/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child:  Column(
      children: [
        Appbars(),
        /// **ส่วนบน - แสดงข้อมูลภาควิชา + OpenStreetMap**
         Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900]!, Colors.blue[600]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **ชื่อภาควิชา**
              Text(
                "📚 ภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ",
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              /// **รายละเอียดเกี่ยวกับภาควิชา**
              Text(
                "คณะวิทยาศาสตร์ประยุกต์\nมหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ",
                style: GoogleFonts.sarabun(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 20),

              /// **แสดง OpenStreetMap**
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 300, // ปรับความสูงของแผนที่
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(13.820158, 100.514354),
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(13.820158, 100.514354),
                            child: Icon(Icons.location_pin, color: Colors.redAccent, size: 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// **ส่วนกลาง - Card ข้อมูลติดต่อ**
        Container(
          color: Colors.blue, // สีพื้นหลังฟ้า
          padding: const EdgeInsets.all(20), // กำหนด padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "📞 ติดต่อเรา",
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _contactInfo(Icons.location_on, "ภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ\nคณะวิทยาศาสตร์ประยุกต์ มจพ.", Colors.orangeAccent),
              const SizedBox(height: 8),
              _contactInfo(Icons.phone, "02-555-2000 ต่อ 4601, 4602", Colors.greenAccent),
              const SizedBox(height: 8),
              _contactInfo(Icons.public, "CIS KMUTNB", Colors.white),
              const SizedBox(height: 20),

              /// **ปุ่ม Facebook**
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    const url = "https://www.facebook.com/people/CIS-Kmutnb/100057122843991/?locale=eo_EO";
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: Icon(Icons.facebook, color: Colors.white, size: 24),
                  label: Text(
                    "เยี่ยมชม Facebook",
                    style: GoogleFonts.kanit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),

        /// **ส่วนล่าง - Copyright**
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// **ข้อความลิขสิทธิ์**
              Text(
                "© 2024 Department of Computer and Information Sciences, Faculty of Applied Science (KMUTNB)",
                style: GoogleFonts.sarabun(color: Colors.white70, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    ));
  }

  /// **Widget สำหรับแสดงข้อมูลติดต่อ**
  Widget _contactInfo(IconData icon, String text, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.sarabun(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
