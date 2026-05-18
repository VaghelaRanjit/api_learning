import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/1_singlePost_controller.dart';

class SinglePostWithModelGetx extends StatelessWidget {
  SinglePostWithModelGetx({super.key});

  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Post With Model GetX"),
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        //  final post = controller.singlePost.value;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // post.userId?.toString() ?? "",
                controller.singlePost.value.userId.toString(),
              ),

              Text(controller.singlePost.value.id.toString() ),
              Text(controller.singlePost.value.title.toString() ),
              Text(controller.singlePost.value.title.toString() ),
            ],
          ),
        );
      }),
    );
  }
}
