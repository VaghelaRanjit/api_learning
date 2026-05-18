import 'package:api_learning/API_Services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Model/3_MultiDataModel.dart';

class Multidatawithmodel extends StatefulWidget {
  const Multidatawithmodel({super.key});

  @override
  State<Multidatawithmodel> createState() => _MultidatawithmodelState();
}

class _MultidatawithmodelState extends State<Multidatawithmodel> {
  // this will ask for data that is why we use just instance
  // MultiDataModel multiDataModel = MultiDataModel(); // here data asks

  MultiDataModel? multidata;

  bool isLoading = false;
  // _getMultiData() {
  //   isLoading = true;
  //   ApiServices()
  //       .getMultiDataWithModel()
  //       .then((value) {
  //         setState(() {
  //           multidata = value!;
  //           isLoading = false;
  //         });
  //       })
  //       .onError((error, stackTrace) {
  //         print(error);
  //       });
  // }


   
  Future<void> _getMultiData() async {

    try {
      final data = await ApiServices().getMultiDataWithModel();
      setState(() {
        isLoading = true;
      });

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

    _getMultiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("MultiData With Model")),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    multidata!.total.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    multidata!.skip.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    multidata!.limit.toString(),
                    style: TextStyle(color: Colors.black),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: multidata!.users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.redAccent,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                multidata!.users[index].image,
                              ),
                            ),
                            title: Text(multidata!.users[index].id.toString()),
                            subtitle: Text(multidata!.users[index].hair.color),

                            //   subtitle:Text(multidata!.users[index].address.coordinates.lat.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
