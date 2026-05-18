import 'package:api_learning/API_Services/api_services.dart';
import 'package:api_learning/Model/2_MultiPostModel.dart';
import 'package:flutter/material.dart';

class MultiPostWithModel extends StatefulWidget {
  const MultiPostWithModel({super.key});

  @override
  State<MultiPostWithModel> createState() => _MultiPostWithModelState();
}

class _MultiPostWithModelState extends State<MultiPostWithModel> {
  bool isLoading = false;
 // we create a list according to the model and give then name multiPostM
  List<MultiPostModel> multiPostModel = [];


  _getMultiPostWithModel() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await ApiServices().getMultiPostWithModel();

      print("API DATA: $data");
      print("DATA LENGTH: ${data?.length}");

      setState(() {
        multiPostModel = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMultiPostWithModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("MultiData With Model")),

      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: multiPostModel.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  color: index % 2 == 0
                      ? Colors
                            .teal // Even index
                      : Colors.yellow, //Odd index

                  child: ListTile(

                    // we have multiple data that's why we will use a index for each data
                    leading: Text(multiPostModel[index].id.toString()),
                    title: Text(multiPostModel[index].title.toString()),
                    subtitle: Text(multiPostModel[index].body.toString()),
                  ),
                );
              },
            ),
    );
  }
}
