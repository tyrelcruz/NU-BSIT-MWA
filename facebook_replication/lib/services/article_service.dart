import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ArticleService {
  List listData = [];

  Future<List> getArticles() async {
    print('Making API request to: $host/posts');
    Response response = await get(Uri.parse('$host/posts'));

    print('Response status code: ${response.statusCode}');
    print('Response body length: ${response.body.length}');

    if (response.statusCode == 200) {
      listData = jsonDecode(response.body);
      print('Successfully parsed ${listData.length} articles from API');
      return listData;
    } else {
      print('API request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
