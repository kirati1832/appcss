import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

final firstImageProvider =
    FutureProvider.family<String?, String>((ref, folderUrl) async {
  try {
    final response = await http.get(Uri.parse(folderUrl));
    if (response.statusCode == 200) {
      var document = html.parse(response.body);
      var links = document.querySelectorAll('a[href]');

      for (var link in links) {
        var href = link.attributes['href'];
        if (href != null && (href.endsWith('.jpg') || href.endsWith('.png'))) {
          return "$folderUrl/$href"; // ✅ Return full URL of first image
        }
      }
    }
  } catch (e) {
    print("❌ Error fetching image: $e");
  }
  return null; // ❌ ไม่พบรูป
});
