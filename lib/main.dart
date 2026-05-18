//import 'package:api_learning/Screens/ScreensWithModel/1_Single_screen_with_model.dart';
//import 'package:api_learning/Screens/ScreenWithoutModel/1_Single_screen_without_model.dart';
// import 'package:api_learning/Screens/ScreenWithoutModel/1_Single_screen_without_model.dart';
// import 'package:api_learning/Screens/ScreensWithModel/1_Single_screen_with_model.dart';
import 'package:api_learning/Model/1_SinglePostModel.dart';
import 'package:api_learning/Screens/ScreensWithModel/1_Single_screen_with_model.dart';
import 'package:api_learning/ScreensWithGetx/ScreensWIthoutModel/1_SinglePostWithoutModelGetX.dart';
import 'package:api_learning/ScreensWithGetx/ScreensWithModel/1_SinglePostWithModelGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'Screens/ScreenWithoutModel/2_Multi_post_without_model.dart';
//import 'Screens/ScreenWithoutModel/3_MultiDataWithoutModel.dart';
// import 'Screens/ScreensWithModel/2_Multi_post_with_model.dart';
// import 'Screens/ScreensWithModel/3_MultiDataWithModel.dart';
 import 'Screens/ScreenWithoutModel/1_Single_screen_without_model.dart';
import 'Screens/ScreenWithoutModel/2_Multi_post_without_model.dart';
import 'Screens/ScreenWithoutModel/3_MultiDataWithoutModel.dart';
import 'Screens/ScreensWithModel/2_Multi_post_with_model.dart';
import 'Screens/ScreensWithModel/3_MultiDataWithModel.dart';
import 'Screens/ScreensWithModel/login_screen.dart';
import 'ScreensWithGetx/ScreensWIthoutModel/2_MultiPostWithoutModelGetX.dart';
import 'ScreensWithGetx/ScreensWithModel/2_MultiPostWithModelGetx.dart';
// import 'Screens/ScreensWithModel/2_Multi_post_with_model.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.tealAccent),

      home: Multidatawithmodel(),
    );
  }
}
//with getx
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(primaryColor: Colors.tealAccent),
//
//       home: ScreenWithModel()
//     );
//   }
// }

