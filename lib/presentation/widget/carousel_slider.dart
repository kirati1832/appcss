import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> images;
  final double height;
  final bool enlargeCenterPage;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;

  const CustomCarouselSlider({
    super.key,
    required this.images,
    this.height = 250.0,
    this.enlargeCenterPage = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        autoPlayInterval: autoPlayInterval,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: enlargeCenterPage,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0, // Makes items take full width of the screen
      ),
      items: images.map((imageUrl) {
        return Container(
          width: screenWidth, // Set the width to full screen width
          margin: const EdgeInsets.symmetric(horizontal: 0), // Remove margins
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, fit: BoxFit.cover, width: screenWidth),
          ),
        );
      }).toList(),
    );
  }
}
