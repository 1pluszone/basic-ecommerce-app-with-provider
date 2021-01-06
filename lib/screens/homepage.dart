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
  int title = 25;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (_) => Cart(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            elevation: 0,
            title: Center(child: Text("$title item(s)")),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: grey,
                          child: Icon(Icons.filter_list)),
                      CircleAvatar(
                          backgroundColor: grey,
                          child: Icon(Icons.airline_seat_legroom_normal)),
                      CircleAvatar(
                          backgroundColor: grey, child: Icon(Icons.search)),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  FutureBuilder<List<DrugModel>>(
                    future: getData(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("An error occured");
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return EachCart(
                                  eachDrug: snapshot.data[index], index: index);
                              // return Text("${snapshot.data.length}");
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
                ],
              ),
              DraggableScrollableSheet(
                  //expand: false,
                  initialChildSize: 0.09,
                  minChildSize: 0.09,
                  maxChildSize: 1.0,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                        controller: scrollController,
                        child: DraggableCartPage(controller: scrollController));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
