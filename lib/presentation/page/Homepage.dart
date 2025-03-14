import 'package:appcsall/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/sidebarmenu.dart';
import '../widget/detail_carousel_slide.dart';
import '../../provider/news_provider.dart';
import '../widget/news_carousel_slider.dart';

// สร้าง StateNotifier สำหรับการจัดการ _currentIndex
class NavigationIndexNotifier extends StateNotifier<int> {
  NavigationIndexNotifier() : super(2);

  void updateIndex(int newIndex) => state = newIndex;
}

// สร้าง Provider สำหรับ _currentIndex
final navigationIndexProvider =
    StateNotifierProvider<NavigationIndexNotifier, int>(
      (ref) => NavigationIndexNotifier(),
    );

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  
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
    "วิทยาการคอมพิวเตอร์ (ป.โท)",
    "วิทยาการคอมพิวเตอร์ (ป.เอก)",
  ];

  final List<String> details = [
    "Bachelor of Science Program in Computer Science",
    "Bachelor of Science Program in Computer Science",
    "Master of Science Program in Computer Science",
    "Master of Science Program in Software Engineering",
    "Doctor of Philosophy Program in Computer Science",
  ];

  final List<String> links = [
    "http://cs.kmutnb.ac.th/course-list.jsp",
    "http://cs.kmutnb.ac.th/course-list-inter.jsp",
    "http://cs.kmutnb.ac.th/course-list_ms_cs.jsp",
    "http://cs.kmutnb.ac.th/course-list_ms_se.jsp",
    "http://cs.kmutnb.ac.th/course-list_phd.jsp",
  ];
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);
    final currentIndex = ref.watch(navigationIndexProvider); // อ่านค่าจาก Provider
    final navigationIndexNotifier = ref.read(navigationIndexProvider.notifier);

    return Scaffold(
      appBar: Appbars(),
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      bottomNavigationBar: BottomNavbar(
        onTap: (index) {
          if (currentIndex == index) return; // ป้องกันการกดซ้ำหน้าเดิม
          
          navigationIndexNotifier.updateIndex(index); // อัปเดต index

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
      drawer: Sidebarmenus(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CustomCarouselSlider(images: gallery),
            const SizedBox(height: 20),
            Text(
              '🗞 ข่าว',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            newsAsync.when(
              data: (newsList) => NewsCarouselSlider(newsList: newsList),
              loading: () => CircularProgressIndicator(),
              error: (error, _) => Text("Error loading news"),
            ),
            const SizedBox(height: 20),
            Text(
              '🎓 หลักสูตรของเรา',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DetailCarouselSlide(
              images: images,
              title: titles,
              detail: details,
              link: links,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
