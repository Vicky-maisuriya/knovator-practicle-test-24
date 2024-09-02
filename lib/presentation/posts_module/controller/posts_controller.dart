import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/post_repo.dart';
import '../models/posts_model.dart';

class PostsController extends GetxController{
  final _posts = <PostsModel>[].obs;

  List<PostsModel> get posts => _posts.toList();

  final _random = Random();

  final _timers = <int, Stopwatch>{}.obs;

  @override
  void onInit() {
    _getAllPosts();
    super.onInit();
  }

  /// Get POSTS via API call.....
  Future<void> _getAllPosts() async {
    final postsData = await PostsRepository(Dio()).getPosts();
    _posts.addAll(postsData);
  }

  /// Generate a random duration between 10 and 30 seconds
  int getRandomDuration() {
    return [10, 20, 25][_random.nextInt(3)]; // 10 to 30 seconds
  }

  void startTimer(int id) {
    if (!_timers.containsKey(id)) {
      _timers[id] = Stopwatch()..start();
    } else {
      _timers[id]?.start();
    }
    update();
  }

  void pauseTimer(int id) {
    _timers[id]?.stop();
    update();
  }

  void resumeTimer(int id) {
    _timers[id]?.start();
    update();
  }

  String getTimerText(int id) {
    if (!_timers.containsKey(id)) return getRandomDuration().toString();
    final stopwatch = _timers[id]!;
    final minutes = (stopwatch.elapsed.inSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}