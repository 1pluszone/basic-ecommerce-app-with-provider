import 'package:dro_test/data/cart.dart';
import 'package:dro_test/model/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reusables/color_codes.dart';
import '../data/fetch.dart';
import '../reusables/each_cart.dart';
import 'draggableCartPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalItems = 0;

  bool searchActive = false;
  String searchValue = "";
  List<DrugModel> searchedList = [];
  FocusNode node = FocusNode();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (_) => Cart(),
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Expanded(
                            child: Text(
                              "$totalItems item(s)",
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(Icons.filter_list,
                                    color: Colors.black54)),
                          ),
                          Expanded(
                            child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.airline_seat_legroom_normal,
                                  color: Colors.black54,
                                )),
                          ),
                          Expanded(
                            child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      searchActive = true;
                                      FocusScope.of(context).requestFocus(node);
                                    });
                                  },
                                )),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                      (!searchActive)
                          ? SizedBox()
                          : Container(
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextField(
                                focusNode: node,
                                controller: searchController,
                                onChanged: (String value) {
                                  setState(() {
                                    searchValue = value.toLowerCase();
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    suffix: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                        setState(() {
                                          searchValue = '';
                                          searchController.clear();
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18.0)))),
                              ),
                            ),
                      FutureBuilder<List<DrugModel>>(
                        future: getData(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("An error occured");
                          } else if (snapshot.hasData) {
                            searchedList = snapshot.data
                                .where((item) => item.drugName
                                    .toLowerCase()
                                    .contains(searchValue))
                                .toList();
                            print(searchedList.length);
                            totalItems = searchedList.length;
                            return Expanded(
                              child: GridView.builder(
                                itemCount: searchedList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return EachCart(
                                    eachDrug: searchedList[index],
                                  );
                                },
                              ),
                            );
                          } else {
                            //loading
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
                DraggableScrollableSheet(
                    //expand: false,
                    initialChildSize: 0.09,
                    minChildSize: 0.09,
                    maxChildSize: 0.95,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                          controller: scrollController,
                          child:
                              DraggableCartPage(controller: scrollController));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
