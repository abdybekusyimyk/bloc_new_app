import 'dart:convert';
import 'dart:developer';
import 'package:bloc_new_app/constans/api_constans.dart';
import 'package:bloc_new_app/models/new_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  const NewsService(this.client);
  final http.Client client;

  Future<List<News>?> getNewsByCountry(String countryCode) async {
    try {
      final uri = Uri.parse(ApiConst.countryNews(countryCode));
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final news =
            (body['articles'] as List).map((e) => News.fromJson(e)).toList();
        return news;
      } else {
        log('${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final newsService = NewsService(http.Client());
