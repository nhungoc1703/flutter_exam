import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/chapter/chapter.dart';
import '../models/chapter/chapter_detail.dart';

class ChapterRepository {
  Future<List<Chapters>> getChapter(String slugChapter) async {
    List<Chapters> listChapter = [];
    try {
      String url =
          'https://truyen-clone.getdata.one/story/${slugChapter}/chapters';
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        listChapter =
            jsonResponse.map((items) => Chapters.fromJson(items)).toList();
        return listChapter;
      } else {
        return [];
      }
    } on Exception {
      // print('Fix API');
      return [];
    }
  }

  Future<ChapterDetail?> getChapterDetail(String idChapDetail) async {
    ChapterDetail? gameDetail;
    try {
      String url =
          'https://truyen-clone.getdata.one/chapter/id/${idChapDetail}';
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        gameDetail = ChapterDetail.fromJson(jsonResponse);
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
