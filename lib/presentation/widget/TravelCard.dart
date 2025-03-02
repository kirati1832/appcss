import 'package:flutter/material.dart';

class TravelCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;

  const TravelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
  });

  @override
  _TravelCardState createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  bool isFavorite = false; // Track favorite state
   bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background Image
            Image.network(
              widget.imageUrl,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),

            // Favorite Icon with Hover Animation
            Positioned(
              top: 15,
              right: 15,
              child: MouseRegion(
                onEnter: (_) => setState(() => isHovered = true), // Mouse enters
                onExit: (_) => setState(() => isHovered = false), // Mouse leaves
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite; // Toggle favorite state
                    });
                  },
                  child: Transform.scale(
                    scale: isHovered ? 1.3 : 1.0, // Scale on hover
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 18,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Overlay with text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white, size: 14),
                        const SizedBox(width: 5),
                        Text(
                          widget.location,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          widget.rating.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
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
    );
  }
}
