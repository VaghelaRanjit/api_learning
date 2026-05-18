import 'package:api_learning/API_Services/api_services.dart';
import 'package:api_learning/Model/1_SinglePostModel.dart';

import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isLoading = false;

  SinglePostWithModel singlePostWithModel = SinglePostWithModel();


  Future<void> _getSinglePost() async {
    try {
      setState(() {
        isLoading = true;
      });

      final data = await ApiServices().getSinglePostWithModel();

      if (data != null) {
        setState(() {
          singlePostWithModel = data;
        });
      } else {
        print("Data is null from API");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Single Post With Model "),
        centerTitle: true,
      ),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                 color: Color(0xFFFFC0CB),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6E6FA),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        child: Center(
                          child: Text(
                            singlePostWithModel.id.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      // Text(singlePostWithModel.userId.toString())

                      Container(
                            decoration: BoxDecoration(
                              color:Color(0xFFE6E6FA),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(singlePostWithModel.title.toString(),style: TextStyle(color: Colors.black),),
                          )),

                      SizedBox(height: 5,),

                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E6FA),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(singlePostWithModel.body.toString(),style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),),
                          )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
