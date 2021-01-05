import 'package:dro_test/model/drug_model.dart';
import 'package:flutter/material.dart';

import '../reusables/color_codes.dart';
import '../data/fetch.dart';
import '../reusables/each_cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int title = 25;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  children: [
                    CircleAvatar(
                        backgroundColor: grey, child: Icon(Icons.filter_list)),
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
                initialChildSize: 0.09,
                minChildSize: 0.09,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                      controller: scrollController, child: DraggableCart());
                })
          ],
        ),
      ),
    );
  }
}

class DraggableCart extends StatefulWidget {
  @override
  _DraggableCartState createState() => _DraggableCartState();
}

class _DraggableCartState extends State<DraggableCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          color: dark_pupple,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: Divider(
                //height: 50,
                thickness: 5,
                color: Colors.white,
                indent: 150,
                endIndent: 150,
              ),
            ),
            Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [Icon(Icons.shopping_basket), Text("Bag")],
                    )),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                          backgroundColor: Colors.white, child: Text("4"))),
                )
              ],
            )
          ],
        ));
  }
}
