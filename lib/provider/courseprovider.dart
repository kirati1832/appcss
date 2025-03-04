import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/course.dart';

final CourseProvider = FutureProvider<List<Course>>((ref) async {
final response = await http.get(Uri.parse('http://202.44.40.179/Data_From_Chiab/json/crew.json'));

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