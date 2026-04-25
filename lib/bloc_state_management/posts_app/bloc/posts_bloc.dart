
import 'package:bloc/bloc.dart';
import 'package:testapp/bloc_state_management/posts_app/bloc/posts_event.dart';
import 'package:testapp/bloc_state_management/posts_app/bloc/posts_state.dart';
import 'package:testapp/bloc_state_management/posts_app/repository/post_repository.dart';
import 'package:testapp/bloc_state_management/posts_app/utils/enums.dart';

import '../models/posts_model.dart';

class PostBloc extends Bloc<PostsEvent , PostStates>{

  List<PostModel> tempPostList = [];
  
  PostRepository postRepository = PostRepository();
  PostBloc():super(const PostStates()){
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }

  void fetchPostApi(PostFetched event , Emitter<PostStates> emit)async{
    await postRepository.fetchPost().then((value){
      emit(state.copyWith(
          postStatus: PostStatus.success,
          message: 'Success',
          postList: value,
      ));
    }).onError((error , stackTrace){
      emit(state.copyWith(postStatus: PostStatus.failure , message: error.toString()));
    });
  }


  void _filterList(SearchItem event , Emitter<PostStates> emit)async{
    if(event.stSearch.isEmpty){
      emit(state.copyWith(tempPostList: [] , searchMessage: ''));
    }else{
      //tempPostList = state.postList.where((element) => element.email == event.stSearch.toString()).toList();

      tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      if(tempPostList.isEmpty){
        emit(state.copyWith(tempPostList: tempPostList , searchMessage: 'No Data Found'));
      }else{
        emit(state.copyWith(tempPostList: tempPostList , searchMessage: ''));
      }
    }
  }
}

