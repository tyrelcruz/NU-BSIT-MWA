import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ArticleService {
  List listData = [];

  Future<List> getArticles() async {
    Response response = await get(Uri.parse('$host/posts'));

    if (response.statusCode == 200) {
      listData = jsonDecode(response.body);
      return listData;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
