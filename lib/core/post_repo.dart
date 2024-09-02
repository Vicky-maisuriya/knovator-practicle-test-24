import 'package:dio/dio.dart';
import '../presentation/post_details_module/models/post_details_model.dart';
import '../presentation/posts_module/models/posts_model.dart';
import 'app_constant.dart';

class PostsRepository {
  Dio? _dio;

  PostsRepository(this._dio);

  /// Get posts list API call using dio package...
  Future<List<PostsModel>> getPosts() {
    return _dio!.get(host).then((value) =>
        value.data?.map<PostsModel>((u) => PostsModel.fromJson(u))?.toList()
    );
  }

  /// Get post details API call using dio package...
  Future<PostDetailsModel> getPostDetails(passData) {
    /// Using postsId to get one post data via API call....
    return _dio!.get('$host/${passData['postsId']}').then((value) =>
        PostDetailsModel.fromJson(value.data)
    );
  }
}