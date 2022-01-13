import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp_project/models/articlemodel.dart';
class News
{

  List<ArticleModel> news = [];
  Future<void> getNews() async{
      String url="https://newsapi.org/v2/top-headlines?country=in&apiKey=fe786372b9ad4b4db8fb363e8c284d96";
      var response=await http.get(Uri.parse(url)); 
      var jsonData = jsonDecode(response.body);
      if(jsonData['status'] == "ok")
      {
        jsonData["articles"].forEach((ele){
        if(ele["urlToImage"]!=null && ele["content"]!=null)
        {
            ArticleModel articleModel= ArticleModel(
              title: ele["title"],
              description: ele["description"],
              url: ele["url"],
              urlToImage: ele["urlToImage"],
              content: ele["content"],

            );
            news.add(articleModel);
        }
        }); 
      }
  } 
}

class NewsForCategory {

  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async{

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=fe786372b9ad4b4db8fb363e8c284d96";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }

      });
    }


  } 
}