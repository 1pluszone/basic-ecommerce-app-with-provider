import 'package:dro_test/data/cart.dart';
import 'package:dro_test/reusables/color_codes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraggableCartPage extends StatefulWidget {
  final ScrollController controller;
  DraggableCartPage({this.controller});
  @override
  _DraggableCartPageState createState() => _DraggableCartPageState();
}

class _DraggableCartPageState extends State<DraggableCartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 6.0),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                indent: 160,
                endIndent: 160,
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
                          backgroundColor: Colors.white,
                          child: Consumer<Cart>(
                              builder: (context, myCart, child) =>
                                  Text(myCart.cartList.length.toString())))),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              child: Text("Tap on an item for add, remove, delete options"),
            ),
            SizedBox(height: 12),
            Consumer<Cart>(
              builder: (context, myCart, child) => Expanded(
                child: ListView.builder(
                    primary: false,
                    //controller: widget.controller,
                    itemCount: myCart.cartList.length,
                    itemBuilder: (context, index) => ListTile(
                          leading: Wrap(spacing: 10, children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                    myCart.cartList[index].drugModel.drugUrl)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child:
                                  Text("${myCart.cartList[index].quantity}X"),
                            )
                          ]),
                          title:
                              Text(myCart.cartList[index].drugModel.drugName),
                          subtitle: Text(
                              myCart.cartList[index].drugModel.dispensedIn),
                          trailing:
                              Text(myCart.cartList[index].amount.toString()),
                        )),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [Text("Total"), Spacer(), Text("234,43")],
                      ),
                      ButtonTheme(
                          buttonColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: RaisedButton(
                            child: Text("Checkout"),
                            onPressed: () {},
                          ))
                    ],
                  ),
                )),
          ],
        ));
  }
}
