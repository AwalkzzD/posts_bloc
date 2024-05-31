import 'package:dio/dio.dart';
import 'package:posts_bloc/base/constants/api/app_api_calls.dart';
import 'package:posts_bloc/data/remote/model/posts_model.dart';
import 'package:posts_bloc/data/remote/utils/dio_manager.dart';

class PostsRepository {
  Future<List<PostsModel>> getPosts() async {
    try {
      print("Posts Api hit");
      return postsModelFromJson((await DioManager.getInstance()!.get(
              AppApiCalls.getPosts,
              options: Options(responseType: ResponseType.plain)))
          .data);
    } on DioException {
      return <PostsModel>[];
    }
  }
}

enum PostsStatus { loading, success, failure }
