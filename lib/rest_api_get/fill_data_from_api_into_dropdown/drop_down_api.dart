import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/rest_api_get/fill_data_from_api_into_dropdown/dropdown_model.dart';

class DropDownApi extends StatefulWidget {
  const DropDownApi({super.key});

  @override
  State<DropDownApi> createState() => _DropDownApiState();
}

class _DropDownApiState extends State<DropDownApi> {

  Future<List<DropdownModel>> getPost()async{
    try{

      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;
      if(response.statusCode == 200){
        return body.map((e){
          final map = e as Map<String , dynamic>;
          return DropdownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }else{

      }
    }on SocketException{
      throw Exception('No internet');
    }
      throw Exception('Error Fetching Data');

  }
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown API'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: getPost(),
                builder: (context , snapshot){
                  if(snapshot.hasData){
                    return DropdownButton(
                      icon: Icon(Icons.add),
                      value: selectedValue,
                        items: snapshot.data!.map((e){
                          return DropdownMenuItem(
                              // value: e.id.toString(),
                              // child: Text(e.id.toString()),
                            value: e.title.toString(),
                            child: Text(e.title.toString()),
                          );
                        }).toList(), 
                        hint: Text('Select value'),
                        isExpanded: true,
                        onChanged: (value){
                          selectedValue = value;
                          setState(() {

                          });
                        }
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
