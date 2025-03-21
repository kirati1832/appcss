import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/staff.dart';

final personnelProvider = FutureProvider<PersonnelData>((ref) async {
  final response = await http.get(Uri.parse('http://202.44.40.179/Data_From_Chiab/json/crew.json'));

  // ✅ แปลงข้อมูลให้เป็น UTF-8 ก่อน Decode JSON
  final jsonData = utf8.decode(response.bodyBytes);
  final Map<String, dynamic> data = json.decode(jsonData);
  print( response.body);
  if (response.statusCode == 200) {
    return PersonnelData.fromJson(data);
  } else {
    throw Exception('Failed to load Personnel');
  }
});
