import 'package:api_learning/API_Services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiPostWithoutModel extends StatefulWidget {
  const MultiPostWithoutModel({super.key});

  @override
  State<MultiPostWithoutModel> createState() => _MultiPostWithoutModelState();
}

class _MultiPostWithoutModelState extends State<MultiPostWithoutModel> {
  bool isLoading = false;
  dynamic multiPost = [];
  Future<void> _getMultiPostWithoutModel() async {
    isLoading = true;
    ApiServices()
        .getMultiPostWithoutModel()
        .then((value) {
          setState(() {
            multiPost = value!;
            isLoading = false;
          });
        })
        .catchError((e) {
          if (kDebugMode) {
            print(e.toString());
            isLoading = false;
          }
        });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMultiPostWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("MultiData Without Model")),
      // body: isLoading == true
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: multiPost.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             // color: index % 2 == 0 ? Colors.teal : Colors.yellow,
      //             child: ListTile(
      //               leading: Text(multiPost[index]["id"].toString()),
      //               title: Text(multiPost[index]['title'].toString()),
      //               subtitle: Text(multiPost[index]['body'].toString()),
      //             ),
      //           );
      //         },
      //       ),

      //using future builder
      body: FutureBuilder(
        future: ApiServices().getMultiPostWithoutModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Card(color: Colors.teal);
                }
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index]["title"].toString()),
                    subtitle: Text(snapshot.data[index]["body"].toString()),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
