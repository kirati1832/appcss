import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Url extends StatefulWidget {
  final String url;

  Url({required this.url});

  @override
  State<Url> createState() => _UrlState();
}

class _UrlState extends State<Url> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                // ตรวจสอบว่ามี URL ที่ต้องการดาวน์โหลดหรือไม่
                if (request.url.endsWith(".pdf") ||
                    request.url.endsWith(".jpg")) {
                  downloadFile(request.url); // เรียกฟังก์ชันดาวน์โหลดไฟล์
                  return NavigationDecision
                      .prevent; // ป้องกันการเปิด URL ใน WebView
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url)); // ใช้ widget.url แทน
  }

  // ฟังก์ชันดาวน์โหลดไฟล์ไปยัง external storage
  Future<void> downloadFile(String url) async {
    try {
      PermissionStatus status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      Dio dio = Dio();

      // หาที่อยู่โฟลเดอร์ Downloads
      Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
      if (!await downloadsDirectory.exists()) {
        print("ไม่พบโฟลเดอร์ Downloads");
        return;
      }

      // กำหนดเส้นทางในการบันทึกไฟล์
      String savePath =
          '${downloadsDirectory.path}/downloaded_file_${DateTime.now().millisecondsSinceEpoch}.pdf';

      // ดาวน์โหลดไฟล์
      await dio.download(url, savePath);
      print('ดาวน์โหลดไฟล์สำเร็จ: $savePath');
    } catch (e) {
      print('เกิดข้อผิดพลาดในการดาวน์โหลด: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://lh3.googleusercontent.com/d/1vOAxsOruch4kDHI_JiZQURCXsQlCx-s6=w1000',
          height: 40, // คงขนาดของโลโก้
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade50,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
