import 'package:appcsall/presentation/page/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'news_detail_screen_riverpod.dart';
import '../../provider/news_provider.dart';
import '../../provider/news_firstimage_provider.dart';
import '../../bottom_navbar.dart';


// State Provider for category selection
final selectedCategoryProvider = StateProvider<int>((ref) => 0);
class NewsListScreenRiverpod extends ConsumerWidget {
  final List<String> categories = [
    "ทั้งหมด",
    "ข่าวภาควิชา",
    "ข่าวคณะและมหาวิทยาลัย",
    "ข่าวทุนการศึกษา",
    "ข่าวรับสมัครงาน-ประชาสัมพันธ์"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);
    final selectedCategoryIndex = ref.watch(selectedCategoryProvider);
    final currentIndex = ref.watch(navigationIndexProvider);
    final navigationIndexNotifier = ref.read(navigationIndexProvider.notifier);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(title: Text("ข่าวสาร",style:TextStyle(color: Colors.white,)),backgroundColor: Colors.blue.shade800,),
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
      body: Column(
        children: [
          
          // Category Selection
          Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () => ref
                        .read(selectedCategoryProvider.notifier)
                        .state = index,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
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
                  );
                }),
              ),
            ),
          ),

          // News List
          Expanded(
            child: newsAsync.when(
              data: (newsList) {
                final filteredNews = selectedCategoryIndex == 0
                    ? newsList
                    : newsList
                        .where((news) =>
                            news['type'] == categories[selectedCategoryIndex])
                        .toList();

                return ListView.builder(
                  itemCount: filteredNews.length,
                  itemBuilder: (context, index) {
                    var news = filteredNews[index];
                    String folderUrl = news['img_url'] ?? '';

                    return Consumer(
                      builder: (context, ref, child) {
                        final imageAsync =
                            ref.watch(firstImageProvider(folderUrl));

                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailRiverpod(
                                  news: news, imageUrl: imageAsync.value),
                            ),
                          ),
                          child: Card(
                            margin: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: imageAsync.when(
                                    data: (imageUrl) => Image.network(
                                      imageUrl ?? 'URL_รูปภาพสำรอง',
                                      width: double.infinity,
                                      height: 180,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        height: 180,
                                        color: Colors.grey[300],
                                        child: Center(
                                          child: Icon(Icons.broken_image,
                                              color: Colors.red, size: 50),
                                        ),
                                      ),
                                    ),
                                    loading: () => Container(
                                      height: 180,
                                      color: Colors.grey[300],
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    error: (error, _) => Container(
                                      height: 180,
                                      color: Colors.grey[300],
                                      child: Center(
                                        child: Icon(Icons.error,
                                            color: Colors.red, size: 50),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news['Title'] ?? 'ไม่มีชื่อเรื่อง',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "📅 ${news['PostDate'] ?? 'ไม่ระบุวันที่'}",
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          news['type'] ?? '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text("Error loading news")),
            ),
          ),
        ],
      ),
    );
  }
}
