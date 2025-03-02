import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:appcsall/presentation/widget/widget.dart';

class TravelCarousel extends StatefulWidget {
  @override
  _TravelCarouselState createState() => _TravelCarouselState();
}

class _TravelCarouselState extends State<TravelCarousel> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> travelData = [
    {
      "imageUrl":
          "http://cs.kmutnb.ac.th/img/csgogreen/1_0.png",
      "title": "CS Cleaning office day",
      "location": "KMUTNB ,Thailand",
      "rating": 4.8,
    },
    {
      "imageUrl":
          "http://cs.kmutnb.ac.th/img/csgogreen/2_0.png",
      "title": "CS แยกขยะ คิดก่อนทิ้งแยกก่อนโยน",
      "location": "KMUTNB ,Thailand",
      "rating": 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 320,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            viewportFraction: 0.75, // Show partial next & previous items
            enlargeCenterPage: true, // Make center item bigger
            enableInfiniteScroll: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              travelData.map((data) {
                return Container(
                  width: double.infinity, // Ensures proper scaling
                  child: TravelCard(
                    imageUrl: data["imageUrl"],
                    title: data["title"],
                    location: data["location"],
                    rating: data["rating"],
                  ),
                );
              }).toList(),
        ),

        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              travelData.map((data) {
                int index = travelData.indexOf(data);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
