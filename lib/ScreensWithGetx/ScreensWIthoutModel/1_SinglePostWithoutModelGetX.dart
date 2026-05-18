import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/1_singlePost_controller.dart';

class ScreenWithoutModelX extends StatelessWidget {
  ScreenWithoutModelX({super.key});

  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Without Model - GetX"), centerTitle: true),

      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final post = controller.singlePostWithoutModel;

        if (post.isEmpty) {
          return Center(child: Text("No Data"));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text(post['userId']?.toString() ?? ""),
            // Text(post['id']?.toString() ?? ""),
            // Text(post['title']?.toString() ?? ""),
            // Text(post['body']?.toString() ?? ""),
            Card(
              color: Colors.greenAccent,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(post['id']?.toString() ?? ""),
                ),
                title: Text(post['title']?.toString() ?? ""),
                subtitle: Text(post['body']?.toString() ?? ""),
              ),
            ),
          ],
        );
      }),
    );
  }
}
