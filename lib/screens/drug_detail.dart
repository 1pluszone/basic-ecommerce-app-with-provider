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
      body: Consumer<Cart>(
        builder: (context, myCart, child) => Stack(children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
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
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: dro_purple),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_basket, color: Colors.white),
                            SizedBox(width: 5),
                            Text(myCart.cartList.length.toString(),
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            widget.eachDrug.drugUrl,
                            height: 200,
                          ),
                        ),
                        Text(widget.eachDrug.drugName,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(widget.eachDrug.drugDesc,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: grey_color,
                            ), //company (emzor) logo here
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SOLD BY"),
                                Text(widget.eachDrug.soldBy,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: dialogColor))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            counter(),
                            SizedBox(width: 7),
                            Text("Pack(s)"),
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(-2, -6),
                                          child: Text(
                                            '₦',
                                            style: boldn20Style,
                                            textScaleFactor: 0.7,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                          text: amount.toString(),
                                          style: boldn20Style),
                                    ]),
                              ),
                            ),
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
                            descSection("PACK SIZE", widget.eachDrug.packSize,
                                Icon(Icons.donut_large, color: dro_purple)),
                            Expanded(
                              child: descSection("PRODUCT ID", "PROCEYPLYLE",
                                  Icon(Icons.donut_large, color: dro_purple, true)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        descSection(
                            "CONSTITUENTS",
                            widget.eachDrug.constituents,
                            Icon(Icons.donut_large, color: dro_purple)),
                        SizedBox(
                          height: 20,
                        ),
                        descSection("DISPENSED IN", widget.eachDrug.dispensedIn,
                            Icon(Icons.donut_large, color: dro_purple)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonBar(alignment: MainAxisAlignment.center, children: [
                ButtonTheme(
                  minWidth: 200.0,
                  buttonColor: dro_purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: RaisedButton(
                      onPressed: () {
                        bool alreadyAdded = false;
                        if (myCart.cartList.contains(widget.eachDrug)) {
                          alreadyAdded = true;
                        } else {
                          CartModel model = new CartModel();
                          model.drugModel = widget.eachDrug;
                          model.eachAmount = widget.eachDrug.amount;
                          model.quantity = _n;
                          model.amount = (model.quantity * model.eachAmount);
                          myCart.addToCart(model);
                        }
                        customDialog(
                            context, widget.eachDrug.drugName, alreadyAdded);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.shopping_basket, color: Colors.white),
                          Text("Add to bag",
                              style: TextStyle(color: Colors.white))
                        ],
                      )),
                ),
              ]))
        ]),
      ),
    );
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
        children: <Widget>[
          IconButton(
            onPressed: minus,
            icon: Icon(Icons.remove),
            iconSize: 20,
          ),
          Text('$_n'),
          IconButton(
            onPressed: add,
            icon: Icon(Icons.add),
            iconSize: 20,
          ),
        ],
      ),
    );
  }

  Row descSection(String title, String subTitle, Icon iconName, [bool center=false]) {
    return Row(children: [
      iconName,
      SizedBox(
        width: 10,
      ),
      Column(children: [Text(title), Text(subTitle)])
    ]);
  }

  int _n = 1;
  void minus() {
    setState(() {
      if (_n != 1) {
        _n--;
        amount = widget.eachDrug.amount * _n;
      }
    });
  }

  void add() {
    setState(() {
      _n++;
      amount = widget.eachDrug.amount * _n;
    });
  }
}
