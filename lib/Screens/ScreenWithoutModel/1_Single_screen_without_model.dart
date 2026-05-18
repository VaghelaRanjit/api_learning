import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../API_Services/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePostWithoutModel;
  // better , no error at runtime and also type safety
  // Map<String , dynamic>? singlePostWithModel;
  bool isLoading = false;

  Future<void> _getSinglePostWithoutModel() async {
    isLoading = true;

    try {
      final response = await ApiServices().getSinglePostWithoutModel();

      setState(() {
        singlePostWithoutModel = response;

        isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print("API Error $e");
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSinglePostWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single Post Without Model")),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          //       : Column(children: [Text(singlePostWithoutModel['id'].toString()),
          //   Text(singlePostWithoutModel['userId'].toString(),),
          // Text(singlePostWithoutModel['title'].toString(),),
          // Text(singlePostWithoutModel['body'].toString(),)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                singlePostWithoutModel['id'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            // height: 30,
                            // width: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                singlePostWithoutModel['title'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            // height: 30,
                            // width: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                singlePostWithoutModel['body'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
