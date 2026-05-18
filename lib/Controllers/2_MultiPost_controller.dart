import 'package:get/get.dart';

import '../API_Services/api_services.dart';
import '../Model/2_MultiPostModel.dart';
import '../Screens/ScreensWithModel/2_Multi_post_with_model.dart';
//
// class MultiPostController extends GetxController {
//
//   final ApiServices _apiServices = ApiServices();
//   // Reactive Variables
//   var isLoading = false.obs;
//
//
//    var multiPostList = <MultiPostModel>[].obs;
//
//
//   // API Function
//   // Future<void> getMultiPost() async {
//   //   try {
//   //     isLoading.value = true;
//   //
//   //     final value = await _apiServices.getMultiPostWithModel();
//   //
//   //    print("API DATA: $value");
//   //
//   //     if (value != null) {
//   //       multiPostList.value = value;
//   //     } else {
//   //       multiPostList.clear();
//   //     }
//   //
//   //     // multiPostList.value = value ?? [];
//   //   } catch (e) {
//   //     print("Controller Error: $e");
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
//
//   //2 Without model
//   var multiPostListWithoutModel = [].obs;
//   Future<void> getMultiPostWithoutModel() async {
//     try {
//       isLoading.value = true;
//
//       final value = await _apiServices.getMultiPostWithoutModel();
//
//       // print("API DATA: $value");
//
//       if (value != null) {
//         multiPostListWithoutModel.value = value;
//       } else {
//         multiPostListWithoutModel.clear();
//       }
//     } catch (e) {
//       print("Controller Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     // getMultiPost();
//     getMultiPostWithoutModel();
//   }
// }


class MultiPostController extends GetxController {

  var isLoading = false.obs;
  var multiPostListWithoutModel = [].obs;

  @override
  void onInit() {
    super.onInit();
    getMultiPostWithoutModel(); //
  }

  void getMultiPostWithoutModel() async {
    isLoading.value = true;

    try {
      var data = await ApiServices().getMultiDataWithoutModel();

      multiPostListWithoutModel.value = data;

    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }
}
