import 'package:flutter/material.dart';
import 'package:newsapp_project/assets/news.dart';
import 'package:newsapp_project/models/articlemodel.dart';
import 'package:newsapp_project/models/categorymodel.dart';
import 'package:newsapp_project/views/articlepage.dart';


class CategoryArea extends StatefulWidget {
  final String category;
  CategoryArea({required this.category});
  @override
  _CategoryAreaState createState() => _CategoryAreaState();
}

class _CategoryAreaState extends State<CategoryArea> {

  List<ArticleModel> articles=[];
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getCategoryAreaClass() async
  {
    CategoryAreaClass newsClass=CategoryAreaClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
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
        child: Container(child: Column(children: [
           Container(
                 padding: EdgeInsets.only(top: 16),
                 child: ListView.builder(
                   itemCount: articles.length,
                   shrinkWrap: true,
                   physics: ClampingScrollPhysics(),
                   itemBuilder: (context,index)
                   {
                     return CardBody
                     (
                       imageUrl: articles[index].urlToImage,
                       title: articles[index].title,
                       content: articles[index].content,
                       url: articles[index].url,
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
