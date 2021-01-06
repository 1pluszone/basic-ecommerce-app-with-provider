import 'package:dro_test/data/cart.dart';
import 'package:dro_test/model/cartModel.dart';
import 'package:dro_test/model/drug_model.dart';
import 'package:dro_test/reusables/color_codes.dart';
import 'package:dro_test/reusables/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                        Consumer<Cart>(
                            builder: (context, myCart, child) =>
                                Text(myCart.cartList.length.toString())),
                      ],
                    )),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          widget.eachDrug.drugUrl,
                          height: 250,
                        ),
                      ),
                      Text(widget.eachDrug.drugName),
                      Text(widget.eachDrug.drugDesc),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(), //company logo here
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SOLD BY"),
                              Text(widget.eachDrug.soldBy)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          counter(),
                          SizedBox(width: 10),
                          Text("Pack(s)"),
                          Expanded(
                              child: Text(
                            //TODO: add naira pre-superScript
                            amount.toString(),
                            textAlign: TextAlign.end,
                          ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "PRODUCT DETAILS",
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.donut_large, color: dro_purple),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(children: [
                                  Text("PACK SIZE"),
                                  Text(widget.eachDrug.packSize)
                                ])
                              ]),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.donut_large),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(children: [
                                    Text("PRODUCT ID"),
                                    Text("PROCEYPLYLE")
                                  ])
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Icon(Icons.donut_large),
                        SizedBox(
                          width: 10,
                        ),
                        Column(children: [
                          Text("CONSTITUENTS"),
                          Text(widget.eachDrug.constituents)
                        ])
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Icon(Icons.donut_large),
                        SizedBox(
                          width: 10,
                        ),
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
              Consumer<Cart>(
                builder: (context, myCart, child) => ButtonTheme(
                  minWidth: 200.0,
                  buttonColor: dro_purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: RaisedButton(
                      onPressed: () {
                        CartModel model = new CartModel();
                        model.drugModel = widget.eachDrug;
                        model.eachAmount = widget.eachDrug.amount;
                        model.quantity = _n;
                        model.amount = (model.quantity * model.eachAmount);
                        myCart.addToCart(model);
                        customDialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.shopping_basket, color: Colors.white),
                          Text("Add to bag",
                              style: TextStyle(color: Colors.white))
                        ],
                      )),
                ),
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
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: minus,
            icon: Icon(Icons.remove),
          ),
          Text('$_n'),
          IconButton(
            onPressed: add,
            icon: Icon(
              Icons.add,
            ),
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
