import 'package:appcsall/presentation/page/url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'Footer.dart';
import '../widget/sidebarmenu.dart';
import '../widget/detail_carousel_slide.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  final List<String> gallery = [
    'https://lh3.googleusercontent.com/d/1Bgr-M0T23MfDuHNClEzw7w-BilSPFqIO=w1000',
    'https://lh3.googleusercontent.com/d/1wQmsiupsteMm1_n2bHbqXeAE6GNvYhDI=w1000',
    'https://lh3.googleusercontent.com/d/1a7NSEzHLlomJGezdoB_VgUZjLGDHsVzi=w1000',
  ];
  final List<String> images = [
    "https://lh3.googleusercontent.com/d/1nfA24-joCPQcm7a_4H49ptYMueGx8uvt=w1000",
    "https://lh3.googleusercontent.com/d/1bi4cKu06V6mqSLiJ7SQBgXNy56cDXpTk=w1000",
    "https://lh3.googleusercontent.com/d/16uhVyxLc2IwKfVIJ6jDf7uCaEtvxx9TB=w1000",
    "https://lh3.googleusercontent.com/d/1Ow6D0FNLSrCS0wqkGm3vAuCmCBfde5kh=w1000",
    "https://lh3.googleusercontent.com/d/1igNcQhZsA6XXroeFogaGLUAjk_m5Wblo=w1000",
  ];

  final List<String> titles = [
    "วิทยาการคอมพิวเตอร์ (ภาคปกติ)",
    "วิทยาการคอมพิวเตอร์ (สองภาษา)",
    "วิศวกรรมซอฟต์แวร์ (ป.โท)",
    "วิศวกรรมซอฟต์แวร์ (ป.โท)",
    "วิทยาการคอมพิวเตอร์ (ป.เอก)",
  ];

  final List<String> details = [
    "Bachelor of Science Program in Computer Science",
    "Bachelor of Science Program in Computer Science",
    "Master of Science Program in Computer Science",
    "Master of Science Program in Software Engineering",
    "Doctor of Philosophy Program in Computer Science",
  ];

  final List<String> dates = [
    "มีนาคม 2564",
    "มีนาคม 2564",
    "มีนาคม 2564",
    "มีนาคม 2564",
    "มีนาคม 2564",
  ];

  final List<String> links = [
    "http://cs.kmutnb.ac.th/csb.jsp",
    "http://cs.kmutnb.ac.th/csb.jsp",
    "http://cs.kmutnb.ac.th/csb.jsp",
    "http://cs.kmutnb.ac.th/csb.jsp",
    "http://cs.kmutnb.ac.th/csb.jsp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars(),
      drawer: Sidebarmenus(),
    
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            /// **แสดงภาพ Carousel**
            CustomCarouselSlider(images: gallery),

            const SizedBox(height: 25),

            /// **หัวข้อหลักสูตร**
            Text(
              '🎓 หลักสูตรของเรา',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.blueAccent,
                    fontSize: 30,
                  ),
            ),

            const SizedBox(height: 15),

            /// **แสดงหลักสูตร**
            DetailCarouselSlide(
              images: images,
              title: titles,
              detail: details,
              date: dates,
              link: links,
            ),

            /// **ข่าวสาร**
            const SizedBox(height: 25),

            //NewsScreen(),
            const SizedBox(height: 15),
            Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('เมนูลัด',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 22),),
                            SizedBox(width: 8,),
                    Row(
                      children: [
                        TextButton(
                          onPressed: (){Navigator.pushNamed(context, '/submenu');},
                          child: Text(
                            'เมนูลัดทั้งหมด',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueAccent,
                                fontSize: 17), // ✅ ทำให้เป็นตัวหนา
                          ),
                        ),
                        IconButton(onPressed: (){Navigator.pushNamed(context, '/submenu');}, icon: Icon(Icons.arrow_circle_right_sharp),color: Colors.blueAccent,padding: EdgeInsets.all(0),)
                      ],
                    )
                  ],
                )),
            HorizontalMenu(),
            const SizedBox(height: 25),

            /// **Footer**
          ],
        ),
      ),
    );
  }
}
