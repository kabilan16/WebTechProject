import 'package:flutter/material.dart';
import 'package:newsapp_project/main.dart';
class ThankYou extends StatelessWidget 
{
  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebTech LabProject', ), backgroundColor: Colors.black,
      actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
      onPressed: () {
        _navigateToHomeScreen(context);
      },
    ),],
      ),
      
      body: Column(
        
        children: <Widget>[  
  
        Container(  
              margin: EdgeInsets.only(top: 280,left: 20,right: 20),
              padding: EdgeInsets.all(12.0),  
              decoration:BoxDecoration(  
                  borderRadius:BorderRadius.circular(8),  
                  color:Colors.grey 
              ),  
              child: Text("Thank you for using this app!",style: TextStyle(color:Colors.white,fontSize:25),),  
            ),  
      ],)
    );
  }
}