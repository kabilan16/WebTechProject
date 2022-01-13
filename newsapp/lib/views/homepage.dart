import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
/*import 'package:newsapp/assets/extras.dart';
import 'package:newsapp/assets/news.dart';
import 'package:newsapp/models/articlemodel.dart';
import 'package:newsapp/models/categorymodel.dart';*/
import 'package:newsapp_project/assets/extras.dart';
import 'package:newsapp_project/assets/news.dart';
import 'package:newsapp_project/models/articlemodel.dart';
import 'package:newsapp_project/models/categorymodel.dart';
import 'package:newsapp_project/views/articlepage.dart';
import 'package:newsapp_project/views/categorynews.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Web Technologies Laboratory Project',)),
      body: Column(
        
        children: <Widget>[  
        Container(  
              margin: EdgeInsets.all(40.0),  
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  borderRadius:BorderRadius.circular(8),  
                  color:Colors.red  
              ),  
              child: Text("Welcome to our News Application",style: TextStyle(color:Colors.white,fontSize:19),),  
            ),  
        Container(  
              margin: EdgeInsets.all(30.0),  
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  borderRadius:BorderRadius.circular(8),  
                  color:Colors.blue[900]  
              ),  
              child: Text("This is an application made using Flutter Framework that uses NewsAPI for fetching latest news happening around the world",style: TextStyle(color:Colors.white,fontSize:20),),  
            ),  
      Center(
        child: ElevatedButton(
          //padding: EdgeInsets.all(12.0),
          //color: Colors.grey[800],
          child: Text(
            'Open News App',
            style: TextStyle(fontSize: 20.0, color: Colors.white), 
          ),
          onPressed: () {
            
            _navigateToNextScreen(context);
          },
        ),
      ),
      ],)
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }
}

class NewScreen extends StatefulWidget {
 
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  List<CategoryModel> categories=<CategoryModel>[];
  List<ArticleModel> articles=<ArticleModel>[];
  bool _loading=true;
  String? imageUrl,title,content;
  @override 
   void initState()
  {
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async
  {
    News newsClass=News();
    await newsClass.getNews();
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
      body: _loading?Center(child: Container(child: CircularProgressIndicator(),)) :
      SingleChildScrollView(
        child: Container
        (
           padding: EdgeInsets.symmetric(horizontal: 15),
           child: Column(children: [
             Container(
               
               height: 70,
               child:
               ListView.builder(itemCount: categories.length,
               scrollDirection: Axis.horizontal,
               shrinkWrap: true
               ,itemBuilder: (context,index)
               {
                 return CardTop(
                   imgAddr: categories[index].imageUrl,
                   category: categories[index].categoryName,
                 );
               })
             ),
      
      
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
      ),
    );
  }
}

class CardTop extends StatelessWidget {
  final String imgAddr,category;
  CardTop({required this.imgAddr,required this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(newsCategory: category.toLowerCase() ,)));
      },
          child: Container(
        
        margin: EdgeInsets.only(right: 16,top: 5),
        child: Stack(
          children: <Widget>
          [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imgAddr,width: 120,height: 60, fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width:120,height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text(category, style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
                ))
            )
          ],
        ),
      ),
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
