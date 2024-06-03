import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_bloc/base/screens/base_widget.dart';
import 'package:posts_bloc/base/utils/widgets/custom_list_view.dart';
import 'package:posts_bloc/bloc/posts/posts_bloc.dart';
import 'package:posts_bloc/bloc/posts/posts_states.dart';
import 'package:posts_bloc/data/remote/repository/posts_repository.dart';

class PostsScreen extends BaseWidget {
  const PostsScreen({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() => _PostsScreenState();
}

class _PostsScreenState extends BaseWidgetState<PostsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Get Posts"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PostsBloc, PostsStates>(
            builder: (context, state) {
              switch (state.postsStatus) {
                case PostsStatus.loading:
                  return getLoadingView();
                case PostsStatus.success:
                  return CustomListView(
                    data: state.postsList,
                    titleBuilder: (post) => Text(post.title),
                    borderWidth: 1,
                    borderColor: Colors.amber,
                    borderRadius: 7,
                  );
                case PostsStatus.failure:
                  return getErrorView();
              }
            },
          ),
        ),
      ),
    );
  }
}
