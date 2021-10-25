import 'package:dio/dio.dart';
import 'package:hackernews/models/article_model.dart';

class ApiManager{
  Future<Article> fetchArticleById(int id) async {
    var dio = Dio();
    final response = await dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json');
    Article article = Article.fromJson(response.data);
    return article;
  }

  Future<List<int>>fetchIdsOfTopArticlesId() async {
    // List<DataModel> listOfDataModel = [];
    List<int> topIds = [];
    var dio = Dio();
    final response = await dio.get('https://hacker-news.firebaseio.com/v0/topstories.json');

    for(var i in response.data){
      topIds.add(i);
    }
    return topIds;
  }
}