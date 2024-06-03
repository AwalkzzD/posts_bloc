import 'package:dio/dio.dart';
import 'package:posts_bloc/base/constants/api/app_api_calls.dart';
import 'package:posts_bloc/data/remote/model/posts_model.dart';
import 'package:posts_bloc/data/remote/utils/dio_manager.dart';

class PostsRepository {
  Future<List<PostsModel>> getPosts() async {
    try {
      return postsModelFromJson((await (await DioManager.getInstance())!.get(
              AppApiCalls.getPosts,
              options: Options(responseType: ResponseType.plain)))
          .data);
    } on DioException catch (ex) {
      print(ex.toString());
      return <PostsModel>[];
    }
  }
}

enum PostsStatus { loading, success, failure }
