import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/course.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final CourseProvider = FutureProvider<List<Course>>((ref) async {
final response = await http.get(Uri.parse('${dotenv.env['BASE_URL']}/Data_From_Chiab/json/crew.json'));

if(response.statusCode == 200){
  final List<dynamic> data  = json.decode(response.body);
  List<Course> newCourse = [];
  for(var item in data){
    newCourse.add(Course.fromJson(item));
  }
  return newCourse;
}else{
  throw Exception('Failed to load Posts');
}

});