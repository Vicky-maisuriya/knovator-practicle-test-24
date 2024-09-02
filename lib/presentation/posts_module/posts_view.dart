import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/storage_preferences.dart';
import 'controller/posts_controller.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  final _controller = Get.find<PostsController>();
  final PreferencesController _preferencesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Obx(()=>
      (_controller.posts.isNotEmpty) ?
          ListView.builder(
            itemCount: _controller.posts.length,
            itemBuilder: (context, index) {
              final posts = _controller.posts[index];
              return VisibilityDetector(key: Key('item-$index'), child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Obx(() {
                    final timerData = _controller.getTimerText(index);
                    return ListTile(
                      tileColor: (_preferencesController.postsRead.contains(posts.id.toString())) ? Colors.white : Colors.yellow,
                      leading: Text(posts.id.toString()),
                      title: Text(posts.title!),

                      /// Marked as read posts
                      subtitle: (_preferencesController.postsRead.contains(posts.id.toString())) ? const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.done_all, color: Colors.blue, size: 16,),
                      ) : const SizedBox(),

                      /// Timer set in right side
                      trailing: TextButton(onPressed: () {
                        _controller.startTimer(index);
                      }, child: Text('${timerData}s'),),

                      /// OnTap to move post details
                      onTap: (){

                        /// Pause timer when I navigate to post details screen.
                        _controller.pauseTimer(index);

                        Get.toNamed('/postDetails', arguments: {'postsId': posts.id})?.then((value){
                          if(value == true){
                            /// Resume timer when I back to post list screen
                            _controller.resumeTimer(index);
                          }
                        });

                        /// POST READ add in the local storage.
                        if(_preferencesController.postsRead.contains(posts.id.toString())){
                          _preferencesController.loadPreferences();
                        } else {
                          _preferencesController.postsRead.add(posts.id.toString());
                          _preferencesController.setPostRead(_preferencesController.postsRead);
                          _preferencesController.loadPreferences();
                        }
                      },
                    );
                  },
                  )
              ), onVisibilityChanged: (visibilityInfo) {
                final visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 0) {
                  /// Resume Timer
                  _controller.resumeTimer(index);
                } else {
                  /// Pause Timer
                  _controller.pauseTimer(index);
                }
              },);
            },
          ) : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
