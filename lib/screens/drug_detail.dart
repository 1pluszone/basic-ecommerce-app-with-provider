import 'package:dro_test/model/drug_model.dart';
import 'package:dro_test/reusables/color_codes.dart';
import 'package:flutter/material.dart';

class DrugDetail extends StatefulWidget {
  final DrugModel eachDrug;
  DrugDetail({this.eachDrug});
  @override
  _DrugDetailState createState() => _DrugDetailState();
}

class _DrugDetailState extends State<DrugDetail> {
  int amount = 0;

  void initState() {
    super.initState();
    amount = widget.eachDrug.amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
                Container(
                    child: Row(
                  children: [
                    Icon(Icons.shopping_basket),
                    Text("3"),
                  ],
                )),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    widget.eachDrug.drugUrl,
                    height: 300,
                  ),
                  Text(widget.eachDrug.drugName),
                  Text(widget.eachDrug.drugDesc),
                  Row(
                    children: [
                      CircleAvatar(),
                      Column(
                        children: [
                          Text("SOLD BY"),
                          Text(widget.eachDrug.soldBy)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      counter(),
                      Text("Pack(s)"),
                      Text(amount.toString())
                    ],
                  ),
                  Text("PRODUCT DETAILS"),
                  Row(
                    children: [
                      Row(children: [
                        Icon(Icons.donut_large),
                        Column(children: [
                          Text("PACK SIZE"),
                          Text(widget.eachDrug.packSize)
                        ])
                      ]),
                      Row(children: [
                        Icon(Icons.donut_large),
                        Column(
                            children: [Text("PRODUCT ID"), Text("PROCEYPLYLE")])
                      ]),
                    ],
                  ),
                  Row(children: [
                    Icon(Icons.donut_large),
                    Column(children: [
                      Text("CONSTITUENTS"),
                      Text(widget.eachDrug.constituents)
                    ])
                  ]),
                  Row(children: [
                    Icon(Icons.donut_large),
                    Column(children: [
                      Text("DISPENSED IN"),
                      Text(widget.eachDrug.dispensedIn)
                    ])
                  ]),
                ],
              ),
            )
          ],
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(alignment: MainAxisAlignment.center, children: [
              ButtonTheme(
                minWidth: 200.0,
                buttonColor: dro_purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.shopping_basket),
                        Text("Add to bag")
                      ],
                    )),
              ),
            ]))
      ]),
    );
  }

  getRow() {
    return Row(children: [Icon(Icons.donut_large)]);
  }

  counter() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: add,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          Text('$_n'),
          IconButton(
            onPressed: minus,
            icon: Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  int _n = 1;
  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }
}
