import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final PostsProvider = FutureProvider<List<Posts>>((ref) async {
final response = await http.get(Uri.parse('${dotenv.env['BASE_URL']}:3000/posts'));

if(response.statusCode == 200){
  final List<dynamic> data  = json.decode(response.body);
  List<Posts> newPosts = [];
  for(var item in data){
    newPosts.add(Posts.fromJson(item));
  }
  return newPosts;
}else{
  throw Exception('Failed to load Posts');
}

});