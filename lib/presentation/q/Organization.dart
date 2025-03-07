import 'package:flutter/material.dart';
import '../widget/appbar.dart';
class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarback(titleText: 'โครงสร้างการบริหารภาควิชาฯ',),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'โครงสร้างการบริหารภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // เมื่อกดที่รูปภาพ จะไปยังหน้า FullScreenImage
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(),
                    ),
                  );
                },
                child: Image.network(
                  "http://202.44.40.179/DATA_From_chiab/Image/img/organization.jpg",
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // กดย้อนกลับไปหน้าหลัก
          },
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.network(
            "http://202.44.40.179/DATA_From_chiab/Image/img/organization.jpg",
          ),
        ),
      ),
    );
  }
}
