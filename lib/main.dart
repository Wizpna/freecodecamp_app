import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freecodecamp_app/rss_class/rssApi.dart';
import 'package:http/http.dart' as http;


Future<RSSApi> fetchPost() async {
  final response =
      await http.get('https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.freecodecamp.org%2Fnews%2Frss%2F');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.#
    print(response.body);
    return RSSApi.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'freecodecamp',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text("freecodecamp", style: TextStyle(color: Colors.white),),
          centerTitle: true,

        ),

        body: StreamBuilder(
          stream: fetchPost().asStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10, top: 10),
                    child: Image.network(snapshot.data.items[index].enclosure.link,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10, bottom: 10),
                    child: Text(snapshot.data.items[index].title, 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  )

                  ],);
                },);
            }

            else if(snapshot.hasError){
              return Text(snapshot.error);
            }
            
              return Center(child: CircularProgressIndicator(),);
          },),
      )
    );
  }
}

