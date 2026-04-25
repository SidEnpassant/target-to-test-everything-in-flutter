import 'package:equatable/equatable.dart';
import 'package:testapp/bloc_state_management/posts_app/models/posts_model.dart';

import '../utils/enums.dart';

class PostStates extends Equatable{

  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;

  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
});

  PostStates copyWith({PostStatus? postStatus , List<PostModel>? postList , String? message , List<PostModel>? tempPostList , String? searchMessage}){
    return PostStates(
    postList: postList ?? this.postList,
    postStatus: postStatus ?? this.postStatus,
    message: message ?? this.message,
    tempPostList: tempPostList ?? this.tempPostList,
    searchMessage: searchMessage ?? this.searchMessage,
    );
}
  @override
  List<Object?> get props => [postStatus , postList , tempPostList , message , searchMessage];
}