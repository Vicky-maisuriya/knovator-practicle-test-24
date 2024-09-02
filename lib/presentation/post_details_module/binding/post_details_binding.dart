import 'package:get/get.dart';
import '../controller/post_details_controller.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailsController());
  }
}
