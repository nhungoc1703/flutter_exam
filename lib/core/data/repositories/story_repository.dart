import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/story/story_by_category.dart';
import '../models/story/story_detail.dart';

class StoryRepository {
  static const limit = 8;

  Future<List<StoriesByCategory>> getStoryByCategory(
      int idCategory, int page) async {
    List<StoriesByCategory> listCategory = [];
    try {
      String url =
          'https://truyen-clone.getdata.one/category/id/${idCategory}/story?page=${page}&limit=${limit}';
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        listCategory = jsonResponse
            .map((items) => StoriesByCategory.fromJson(items))
            .toList();
        return listCategory;
      } else {
        return [];
      }
    } on Exception {
      // print('Fix API');
      return [];
    }
  }

  Future<StoryDetail?> getStoryDetail(String slugStoryDetail) async {
    StoryDetail? gameDetail;
    try {
      String url = 'https://truyen-clone.getdata.one/story/${slugStoryDetail}';
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        gameDetail = StoryDetail.fromJson(jsonResponse);
        return gameDetail;
      } else {
        // throw Exception('Failed to load themes');
      }
    } on Exception {
      print('Fix API');
    }
    return gameDetail;
  }
}
