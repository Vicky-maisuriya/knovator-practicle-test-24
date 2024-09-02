import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesController extends GetxController {
  var postsRead = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPreferences();
  }

  /// Load preferences from shared_preferences
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    postsRead.value = prefs.getStringList('posts_read') ?? [];
  }

  Future<void> setPostRead(postsList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('posts_read', postsList);
  }
}
