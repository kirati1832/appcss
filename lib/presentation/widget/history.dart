import 'package:appcsall/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class History extends StatefulWidget {
  final List<Map<String, String>> imageData;

  const History({super.key, required this.imageData});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _currentIndex = 0;
  double _dragOffset = 0;
  bool _showText = false;
  bool _arrowVisible = true;

  @override
  void initState() {
    super.initState();
    _startImageTransition();
    _startArrowAnimation();
  }

  void _startImageTransition() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imageData.length;
        });
      }
    });
  }

  void _startArrowAnimation() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (mounted) {
        setState(() {
          _arrowVisible = !_arrowVisible;
        });
      }
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.primaryDelta!;
      if (_dragOffset < -100) {
        _showText = true;
      }
      if (_dragOffset < -250) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => ArticleScreen(
              image: widget.imageData[_currentIndex]['image']!,
              year: widget.imageData[_currentIndex]['year']!,
              article: widget.imageData[_currentIndex]['article']!,
            ),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ).then((_) {
          setState(() {
            _dragOffset = 0;
            _showText = false;
          });
        });
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_dragOffset > -100) {
      setState(() {
        _dragOffset = 0;
        _showText = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double boxHeight = (_dragOffset.abs() / 300).clamp(0.1, 0.5) *
        MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Appbarback(titleText: 'ประวัติภาควิชาฯ',),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: Stack(
          children: [
            /// **เปลี่ยนภาพจางเข้า-จางออก**
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              child: Image.network(
                widget.imageData[_currentIndex]['image']!,
                key: ValueKey<int>(_currentIndex),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            /// **พื้นหลังมืดด้านบนพร้อมกับปี พ.ศ.**
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Text(
                  widget.imageData[_currentIndex]['year']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// **กล่องดำที่เลื่อนขึ้นพร้อมบทความ**
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: boxHeight,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (boxHeight < 150)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: _arrowVisible ? 1.0 : 0.2,
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    if (boxHeight > 150)
                      Text(
                        widget.imageData[_currentIndex]['article']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
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

/// **หน้าบทความ**
class ArticleScreen extends StatelessWidget {
  final String image;
  final String year;
  final String article;

  const ArticleScreen({
    super.key,
    required this.image,
    required this.year,
    required this.article,
  });

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // ✅ จัดเรียงให้อยู่ชิดซ้าย
          children: [
            /// **ภาพเต็มจอ ไม่มีขอบข้าง**
            Image.network(
              image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            /// **ปี พ.ศ.**
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20), // ✅ เว้นระยะขอบ
              child: Text(
                year,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left, // ✅ ชิดซ้าย
              ),
            ),
            const SizedBox(height: 10),

            /// **หัวข้อบทความ**
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20), // ✅ เว้นระยะขอบ
              child: const Text(
                "บทความเกี่ยวกับภาพนี้",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left, // ✅ ชิดซ้าย
              ),
            ),
            const SizedBox(height: 10),

            /// **เนื้อหาบทความ**
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20), // ✅ เว้นระยะขอบ
              child: Text(
                article,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
                textAlign: TextAlign.left, // ✅ ชิดซ้าย
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
