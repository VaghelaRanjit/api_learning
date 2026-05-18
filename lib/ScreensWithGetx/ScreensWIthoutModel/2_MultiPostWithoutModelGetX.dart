import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/2_MultiPost_controller.dart';



class MultiPostWithoutModelGetX extends StatelessWidget {

  final controller = Get.put(MultiPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mutli post Without Model screen X"),
      centerTitle: true,),

      body: Obx(() {

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.multiPostListWithoutModel.isEmpty) {
          return Center(child: Text("No Data Found"));
        }

        return ListView.builder(
          itemCount: controller.multiPostListWithoutModel.length,
          itemBuilder: (context, index) {

            final post = controller.multiPostListWithoutModel[index];

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                post['title'] ?? "No Title",
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        );
      }),
    );
  }
}
