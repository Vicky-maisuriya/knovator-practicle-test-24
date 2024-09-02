import 'package:get/get.dart';
import '../../../core/storage_preferences.dart';
import '../controller/posts_controller.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsController());
    Get.lazyPut(() => PreferencesController());
  }
}
