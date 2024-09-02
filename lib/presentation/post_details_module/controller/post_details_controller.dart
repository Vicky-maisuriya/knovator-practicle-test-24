import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/post_repo.dart';
import '../models/post_details_model.dart';

class PostDetailsController extends GetxController{

  var args = Get.arguments;
  Rx<PostDetailsModel> postDetails = PostDetailsModel().obs;

  @override
  void onInit() {
    _getPostDetails();
    super.onInit();
  }

  /// Get POST DETAILS via API call.....
  Future<void> _getPostDetails() async {
    final postDetailsData = await PostsRepository(Dio()).getPostDetails(args);
    postDetails.value = postDetailsData;
  }

}