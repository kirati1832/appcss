import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../page/url.dart';

class DetailCarouselSlide extends StatelessWidget {
  final List<String> images;
  final List<String> title;
  final List<String> detail;
  final List<String> date;
  final List<String> link;
  final double height;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;

  const DetailCarouselSlide({
    super.key,
    required this.images,
    required this.title,
    required this.detail,
    required this.date,
    required this.link,
    this.height = 420.0, // ลดความสูงเล็กน้อย
    this.viewportFraction = 0.8, // ให้เห็นการ์ดข้างๆ
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
      items:
          images.asMap().entries.map((entry) {
            int index = entry.key;
            String imageUrl = entry.value;
            String currentTitle = title[index];
            String currentDetail = detail[index];
            String currentDate = date[index];
            String currentLink = link[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 3,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **รูปภาพ**
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// **เนื้อหา**
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **วันที่**
                        Row(
                          children: [
                            const Icon(
                              Icons.event,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              currentDate,
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        /// **ชื่อหลักสูตร**
                        Text(
                          currentTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.kanit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent.shade700,
                          ),
                        ),
                        const SizedBox(height: 6),

                        /// **รายละเอียดหลักสูตร**
                        Text(
                          currentDetail,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.sarabun(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),

                        /// **ปุ่มดูรายละเอียด**
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Url(url: currentLink),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.blueAccent.shade700,
                            ),
                            child: Text(
                              'ดูรายละเอียด',
                              style: GoogleFonts.kanit(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
