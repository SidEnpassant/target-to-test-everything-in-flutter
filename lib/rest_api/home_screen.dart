import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/PostsModel.dart';

class HomeScreenRestApi extends StatefulWidget {
  const HomeScreenRestApi({super.key});

  @override
  State<HomeScreenRestApi> createState() => _HomeScreenRestApiState();
}

class _HomeScreenRestApiState extends State<HomeScreenRestApi> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
      "User-Agent": "Mozilla/5.0",
      "Accept": "application/json",
    },
    );
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }

  late Future<List<PostsModel>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = getPostApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api hands on',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: futurePosts,
                builder: (context , snapshot){
                  if(!snapshot.hasData){
                    return Text('Loading');
                  }else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context , index){
                      //return Text(postList[index].title.toString());
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  Text(postList[index].title.toString()),
                                  SizedBox(height: 10,),

                                  Text('Description', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  Text(postList[index].title.toString()),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          );
                    });
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}