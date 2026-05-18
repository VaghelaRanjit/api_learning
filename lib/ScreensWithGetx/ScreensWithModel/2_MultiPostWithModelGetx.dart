// import 'package:api_learning/Controllers/2_MultiPost_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
//
// class MultiPost extends StatelessWidget {
//    MultiPost({super.key});
//
//   final controller = Get.put(MultiPostController());
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Multi Post")),
//
//       body: Obx(() {
//         // Loading
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         // No Data
//         if (controller.multiPostList.isEmpty) {
//           return Center(child: Text("No Data Found"));
//         }
//
//         // Data Show
//         return ListView.builder(
//           itemCount: controller.multiPostList.length,
//           itemBuilder: (context, index) {
//             final post = controller.multiPostList[index];
//
//             return Padding(
//               padding: const EdgeInsets.all(10),
//               child: Text(
//                 post.title ?? "No Title",
//                 style: TextStyle(fontSize: 18),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
