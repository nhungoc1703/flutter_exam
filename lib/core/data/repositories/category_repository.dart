import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category/category.dart';

class CategoryRepository {
  String url = 'https://truyen-clone.getdata.one/category';
  Future<List<Categories>> getCategory() async {
    List<Categories> listCategory = [];
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        listCategory =
            jsonResponse.map((items) => Categories.fromJson(items)).toList();
        return listCategory;
      } else {
        return [];
      }
    } on Exception {
      // print('Fix API');
      return [];
    }
  }
}
