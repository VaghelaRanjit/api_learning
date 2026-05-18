import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../API_Services/api_services.dart';
import '../Model/1_SinglePostModel.dart';

class PostController extends GetxController {


  //1 SinglePostWithModelGetX
  // Rx<SinglePostWithModel> singlePostWithModel = SinglePostWithModel().obs;

  final ApiServices _apiServices = ApiServices();
  // Reactive Variables
  var isLoading = false.obs;



  var singlePost = SinglePostWithModel().obs;

  Future<void> fetchSinglePost() async {
    try {
      isLoading.value = true;

      final data = await _apiServices.getSinglePostWithModel();

      if (data != null) {
        singlePost.value = data;
      }

     // singlePost.value = data!;
    } catch (e) {
      print("Controller Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //SinglePostWithoutModelGetX

  // Reactive variable
  // var singlePostWithoutModel = {}.obs;   // Map reactive
  var singlePostWithoutModel = <String, dynamic>{}.obs;

  Future<void> fetchSinglePostWithoutModel() async {
    try {
      isLoading.value = true;

      final data  =
      await _apiServices.getSinglePostWithoutModel();

      if (data != null) {
        singlePostWithoutModel.value = data;
      }

    } catch (e) {
      print("API Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchSinglePostWithoutModel();
    fetchSinglePost();
    super.onInit();
  }

}
