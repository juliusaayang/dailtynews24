import 'package:http/http.dart' as http;
import 'package:dailynews24/common/constants.dart';

class ApiService {
  var client = http.Client();
  String endpoint = Constants.API_BASE_URL + Constants.API_PREFIX;
  String apiKey = Constants.API_KEY;

  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8", "Accept": "application/json"};

  Future<http.Response> getTopHeadlines() {
    return client.get(
      Uri.parse('https://dailynews24.ng/wp-json/wp/v2/posts'),
      headers: headers,
    );
  }

  Future<http.Response> getEverything(
    int? keyword,
    int? page,
  ) {
    return client.get(
      Uri.parse(
        'https://dailynews24.ng/wp-json/wp/v2/posts?${keyword == null ? '' : 'categories=$keyword'}${'&per_page=10'}${page == null ? '' : '&page=$page'}',
      ),
      headers: headers,
    );
  }

  Future<http.Response> getCategories() {
    return client.get(
      Uri.parse('https://dailynews24.ng/wp-json/wp/v2/categories'),
      headers: headers,
    );
  }

  Future<http.Response> searchNews(String text) {
    return client.get(
      Uri.parse('https://dailynews24.ng/wp-json/wp/v2/posts?search=$text'),
      headers: headers,
    );
  }
}
