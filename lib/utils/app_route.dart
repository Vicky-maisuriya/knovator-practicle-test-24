import 'package:get/get.dart';
import '../presentation/post_details_module/binding/post_details_binding.dart';
import '../presentation/post_details_module/post_details_view.dart';
import '../presentation/posts_module/binding/posts_binding.dart';
import '../presentation/posts_module/posts_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: '/',
    page: () => PostsView(),
    binding: PostsBinding(),
  ),
  GetPage(
    name: '/postDetails',
    page: () => PostDetailsView(),
    binding: PostDetailsBinding(),
  ),
];

