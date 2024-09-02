import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/post_details_controller.dart';

class PostDetailsView extends StatelessWidget {
  PostDetailsView({super.key});
  final _controller = Get.find<PostDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Get.back(result: true);
          },
        ),
        title: const Text('Post Details'),
      ),
      body: Obx(() =>
      (_controller.postDetails.value.title != null) ?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const Divider(),
              Text(_controller.postDetails.value.title.toString()),
              const SizedBox(height: 30,),
              const Text('Body', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const Divider(),
              Text(_controller.postDetails.value.body.toString()),
            ],
          ),
        ) : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
