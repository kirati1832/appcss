import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../model/staff.dart';

final PersonnelProvider = FutureProvider<List<Personnel>>((ref) async {
final response = await http.get(Uri.parse('http://202.44.40.179/Data_From_Chiab/json/crew.json'));

if(response.statusCode == 200){
  final List<dynamic> data  = json.decode(response.body);
  List<Personnel> newPersonnel = [];
  for(var item in data){
    newPersonnel.add(Personnel.fromJson(item));
  }
  return newPersonnel;
}else{
  throw Exception('Failed to load Posts');
}

});