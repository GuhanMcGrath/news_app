import 'package:news_app/data_model/article_data.dart';
import 'package:news_app/data_model/article_model.dart';

class SearchData {
  List<ArticleModel> searchdata;
  ArticleData _article = ArticleData();
  List<String> urls = [
    "https://newsapi.org/v2/top-headlines?country=in&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=5ecab461359242c7a2193f9ab6194ec0",
    "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=5ecab461359242c7a2193f9ab6194ec0"
  ];
  Future<List<ArticleModel>> getArticles() async {
    for (var i in urls) {
      _article.geturl(i);
      await _article.getData();
      searchdata = _article.getDetails();
    }
    print(searchdata.length);
    return searchdata;
  }
}
