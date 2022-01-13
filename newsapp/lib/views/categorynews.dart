import 'package:flutter/material.dart';
import 'package:newsapp_project/assets/news.dart';
import 'package:newsapp_project/models/articlemodel.dart';
import 'package:newsapp_project/models/categorymodel.dart';
import 'package:newsapp_project/views/articlepage.dart';


class CategoryNews extends StatefulWidget {

  final String newsCategory;

  CategoryNews({required this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
        Text("WebTech LabProject"),
      ],), 
      elevation: 0.0,
       ),
      body: _loading?Center(child: Container(child: CircularProgressIndicator(),)) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
           Container(
                 padding: EdgeInsets.only(top: 16),
                 child: ListView.builder(
                   itemCount: newslist.length,
                   shrinkWrap: true,
                   physics: ClampingScrollPhysics(),
                   itemBuilder: (context,index)
                   {
                     return CardBody
                     (
                       imageUrl: newslist[index].urlToImage,
                       title: newslist[index].title,
                       content: newslist[index].content,
                       url: newslist[index].url,
                     );
                   })
               ,)
             ],),
          ),
      )
          
    );
  }
}

class CardBody extends StatelessWidget {
  
  final String? imageUrl,title,content,url;
  //String imageur=imageUrl;
  CardBody({required this.imageUrl,required this.title,required this.content,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticlePage(
          blogUrl: url.toString(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),  
          child:Image.network(imageUrl.toString()),
          ),
          SizedBox(height: 8,),
          Text(title.toString(), style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 8,),
          Text(content.toString(), style: TextStyle(color: Colors.grey),)
        ],)
      ),
    );
  }
}
