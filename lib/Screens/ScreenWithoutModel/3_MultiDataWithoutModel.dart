import 'package:api_learning/API_Services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiDataWithoutModel extends StatefulWidget {
  const MultiDataWithoutModel({super.key});

  @override
  State<MultiDataWithoutModel> createState() => _MultiDataWithoutModelState();
}

class _MultiDataWithoutModelState extends State<MultiDataWithoutModel> {
  dynamic multidata;
  bool isLoading = false;
  // _getMultiDataWithoutModel() {
  //   isLoading = true;
  //   ApiServices()
  //       .getMultiDataWithoutModel()
  //       .then((value) {
  //         setState(() {
  //           multidata = value;
  //           isLoading = false;
  //         });
  //       })
  //       .onError((error, stackTrace) {
  //         print(error.toString());
  //       });
  // }

  Future<void> _getMultiDataWithoutModel() async {
    try {
 setState(() {

   isLoading = true;

 });
      final data = await ApiServices().getMultiDataWithoutModel();
      if (data != null) {
        setState(() {
          multidata = data;
          isLoading = false;
        });
      }
    } catch (e) {


      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print(e.toString());

      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMultiDataWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MultiData without model"), centerTitle: true),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(multidata["total"].toString()),
                Text(multidata['skip'].toString()),
                Text(multidata['limit'].toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: multidata!["users"].length,
                    itemBuilder: (context, index) {
                      var user = multidata["users"][index];
                      return Card(
                        child: ListTile(
                          // hoverColor: Colors.green,
                          tileColor: Colors.orange,

                          leading: CircleAvatar(
                            radius: 25,
                            // backgroundImage: NetworkImage(user["image"]),
                            backgroundImage: NetworkImage(
                              multidata!["users"][index]["image"],
                            ),
                          ),

                         title: Text("${user["firstName"]} ${user["lastName"]}"),
                           // title: Text(
                           //   user["firstName"],
                           //   style: TextStyle(fontWeight: FontWeight.bold),
                           // ),
                           subtitle: Text(user["email"]),
                           trailing: Text(
                             user["age"].toString(),
                             style: TextStyle(fontSize: 40),
                           ),
                          // title: Text(multidata!["users"][index]["image"]),
                          // subtitle: Text(multidata!["users"][index]["image"]),
                          // trailing: Text(multidata!["users"][index]["image"]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
