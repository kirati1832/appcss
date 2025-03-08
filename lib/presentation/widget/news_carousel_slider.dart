import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../provider/news_firstimage_provider.dart';
import 'news_detail_screen_riverpod.dart';
import '../news/news_list_screen_riverpod.dart';

class NewsCarouselSlider extends ConsumerWidget {
  final List<dynamic> newsList;

  NewsCarouselSlider({required this.newsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topNews = newsList.take(5).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ข่าว",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsListScreenRiverpod()),
                ),
                child: Text("ดูทั้งหมด", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 200,
              autoPlay: true,
              viewportFraction: 0.9,
              enlargeCenterPage: true),
          itemCount: topNews.length,
          itemBuilder: (context, index, realIndex) {
            var news = topNews[index];
            String folderUrl = news['img_url'] ?? '';
            final imageAsync = ref.watch(firstImageProvider(folderUrl));
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailRiverpod(
                      news: news, imageUrl: imageAsync.value),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imageAsync.when(
                      data: (imageUrl) => Image.network(
                        imageUrl ?? 'URL_รูปภาพสำรอง',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      loading: () => Container(
                        color: Colors.grey[300],
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (error, _) => Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.red, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black54,
                      child: Text(
                        news['Title'] ?? 'ไม่มีชื่อเรื่อง',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
