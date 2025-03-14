import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final newsProvider = FutureProvider<List<dynamic>>((ref) async {
  final url = Uri.parse('${dotenv.env['BASE_URL']}:3000/posts');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load news');
  }
});
