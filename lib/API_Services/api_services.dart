import 'dart:convert';
// import 'dart:math';

import 'package:api_learning/Model/1_SinglePostModel.dart';
import 'package:api_learning/Model/2_MultiPostModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Model/3_MultiDataModel.dart';
import '../Model/login_model.dart';

class ApiServices {
  //1.getSinglePostWithModel
  // Future<SinglePostWithModel?> getSinglePostWithModel() async {
  //   try {
  //     var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  //     var response = await http.get(url);
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       SinglePostWithModel model = SinglePostWithModel.fromJson(
  //         jsonDecode(response.body),
  //
  //
  //       );
  //
  //       return model;
  //      // print(model);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //
  //   return null;
  // }


  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "User-Agent": "Mozilla/5.0"
        },
      );

      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        return SinglePostWithModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        print("API failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("API ERROR: $e");
    }

    return null;
  }


  // //2.GetSinglePostWithoutModel **//
  //
  Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(
        url,
        headers: {
        "Accept": "application/json",
        "User-Agent": "Mozilla/5.0"
      },);

      if (response.statusCode == 200 || response.statusCode == 201) {
        //without getX code
        // final body = response.body ;
        // final data = jsonDecode(body);
        //return data;
        return jsonDecode(response.body ) as Map<String,dynamic>;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    return null;
  }
  //
  // Future<Map<String, dynamic>?> getSinglePostWithoutModel() async {
  //   try {
  //     final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  //     final response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body) as Map<String, dynamic>;
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //   return null;
  // }

  //** 3.GetMultiplePostWithModel[List] **//
  //
  // Future<List<MultiPostModel>?> getMultiPostWithModel() async {
  //   try {
  //     var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //
  //     var response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       List<MultiPostModel> model = List<MultiPostModel>.from(
  //         json.decode(response.body).map((x) => MultiPostModel.fromJson(x)),
  //       );
  //       return model;
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  //   return null;
  // }

  Future<List<MultiPostModel>?> getMultiPostWithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      var response = await http.get(url);

      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);

        List<MultiPostModel> model =
        data.map((e) => MultiPostModel.fromJson(e)).toList();

        return model;
      } else {
        print("API FAILED");
        return [];
      }
    } catch (e) {
      print("ERROR: $e");
      return [];
    }
  }

  //4.GetMultipleDataWithoutModel[List]
  Future<dynamic> getMultiPostWithoutModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      var response = await http.get(url);

      if (response.statusCode ==200 && response.statusCode==201)  {
        final data = jsonDecode(response.body);

        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
  // 5 GetMultiDataWithModel[List+object]

  Future<MultiDataModel?> getMultiDataWithModel() async {
    try {
      final url = Uri.parse("https://dummyjson.com/users?limit=5");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        MultiDataModel model = MultiDataModel.fromJson(
          json.decode(response.body),
        );

        return model;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
    return null;
  }

  // 6 GetMultiDataWithoutModel[List+object]
  Future<dynamic?> getMultiDataWithoutModel() async {
    try {
      final url = Uri.parse("https://dummyjson.com/users?limit=5");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        return decodedData;
      }
    } catch (e) {
      // print("Exception: $e");

      if(kDebugMode){
        print(e.toString());
      }
      return null;
    }
    return null;
  }

  //Login API

  // Future<LoginModel?> userLoginWithModel(
  //   String emailController,
  //   String passwordController,
  // ) async {
  //   try {
  //     var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
  //
  //     var response = await http.post(
  //       url,
  //       body: {"email": emailController, "password": passwordController},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
  //
  //       return loginModel;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<LoginModel?> userLoginWithModel(
      String emailController,
      String passwordController,
      ) async {
    try {
      var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "email": emailController,
          "password": passwordController
        }),
      );

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.body);
      //   return LoginModel.fromJson(data);
      // } else {
      //   print("Login Failed: ${response.body}");
      //   return null;
      // }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // print("SUCCESS BODY: ${response.body}");
        // var data = jsonDecode(response.body);
        // return LoginModel.fromJson(data);

        return LoginModel.fromJson(jsonDecode(response.body));


      } else {
        print("STATUS CODE: ${response.statusCode}");
        print("FAILED BODY: ${response.body}");
        return null;
      }


    } catch (e) {
      // print("Error: $e");
      // return null;

      if(kDebugMode){

        print(e.toString());
      return null;
      }
    }
    return null;
  }

}
