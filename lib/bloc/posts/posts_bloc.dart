import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:posts_bloc/bloc/posts/posts_events.dart';
import 'package:posts_bloc/bloc/posts/posts_states.dart';
import 'package:posts_bloc/data/remote/model/posts_model.dart';
import 'package:posts_bloc/data/remote/repository/posts_repository.dart';

class PostsBloc extends Bloc<PostsEvents, PostsStates> with HydratedMixin {
  PostsRepository postsRepository = PostsRepository();

  PostsBloc() : super(const PostsStates()) {
    on<PostsFetchEvent>(fetchPosts);
  }

  FutureOr<void> fetchPosts(
      PostsFetchEvent postFetchEvent, Emitter<PostsStates> emit) async {
    await postsRepository.getPosts().then((posts) {
      emit(state.copyWith(
        postsStatus: PostsStatus.success,
        postsList: posts,
        message: 'Success',
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postsStatus: PostsStatus.failure, message: error.toString()));
    });
  }

  @override
  PostsStates? fromJson(Map<String, dynamic> json) {
    try {
      return PostsStates(
        postsStatus: PostsStatus.success,
        postsList: (json['postsList'] as List)
            .map((post) => PostsModel.fromJson(post))
            .toList(),
        message: json['message'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PostsStates state) {
    try {
      if (state.postsStatus == PostsStatus.success) {
        return {
          'postsStatus': state.postsStatus.toString(),
          'postsList': state.postsList.map((post) => post.toJson()).toList(),
          'message': state.message,
        };
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
