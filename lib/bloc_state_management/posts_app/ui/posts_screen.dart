import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc_state_management/posts_app/bloc/posts_event.dart';
import 'package:testapp/bloc_state_management/posts_app/bloc/posts_state.dart';
import 'package:testapp/bloc_state_management/posts_app/utils/enums.dart';

import '../bloc/posts_bloc.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts API'),
      ),
      body: BlocBuilder<PostBloc , PostStates>(
          builder: (context , state){
            switch(state.postStatus){
              case PostStatus.loading:
                return CircularProgressIndicator();
              case PostStatus.failure:
                return Text(state.message.toString());
              case PostStatus.success:
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4 , right: 4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search with email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (filterKey){
                          context.read<PostBloc>().add(SearchItem(filterKey));
                        },
                      ),
                    ),
                    Expanded(
                      child: state.searchMessage.isNotEmpty ? Center(child: Text(state.searchMessage.toString())) :
                      ListView.builder(
                        itemCount: state.tempPostList.isEmpty ? state.postList.length : state.tempPostList.length ,
                        itemBuilder: (context , index){
                          if(state.tempPostList.isNotEmpty){
                            final item = state.tempPostList[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  item.email.toString(),
                                ),
                                subtitle: Text(
                                  item.body.toString(),
                                ),
                              ),
                            );
                          }else{
                            final item = state.postList[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  item.email.toString(),
                                ),
                                subtitle: Text(
                                  item.body.toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
            }
          }
      ),
    );
  }
}
