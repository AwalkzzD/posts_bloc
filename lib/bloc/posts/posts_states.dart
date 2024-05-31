import 'package:equatable/equatable.dart';
import 'package:posts_bloc/data/remote/model/posts_model.dart';
import 'package:posts_bloc/data/remote/repository/posts_repository.dart';

class PostsStates extends Equatable {
  final PostsStatus postsStatus;
  final List<PostsModel> postsList;

  final String message;

  const PostsStates({
    this.postsStatus = PostsStatus.loading,
    this.postsList = const <PostsModel>[],
    this.message = '',
  });

  PostsStates copyWith(
      {PostsStatus? postsStatus,
      List<PostsModel>? postsList,
      String? message}) {
    return PostsStates(
      postsStatus: postsStatus ?? this.postsStatus,
      postsList: postsList ?? this.postsList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postsStatus, postsList];
}
