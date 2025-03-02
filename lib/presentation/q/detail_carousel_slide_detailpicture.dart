import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'FullScreenImagePage.dart';

class DetailCarouselSlide extends StatelessWidget {
  final List<String> images;

  final double height;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;

  const DetailCarouselSlide({
    super.key,
    required this.images,
    this.height = 420.0,
    this.viewportFraction = 0.8,
    this.enlargeCenterPage = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        autoPlayInterval: autoPlayInterval,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: enlargeCenterPage,
        aspectRatio: 16 / 9,
        viewportFraction: viewportFraction,
      ),
      items: images.map((imageUrl) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **รูปภาพ**
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    // ✅ เปิดหน้าดูภาพเต็มจอ
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreenImagePage(imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}
