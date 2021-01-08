import 'package:dro_test/data/cart.dart';
import 'package:dro_test/screens/cartPage.dart';
import 'package:dro_test/screens/draggableCartPage.dart';
import 'package:dro_test/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_codes.dart';

customDialog(BuildContext context, String drugName, bool alreadyAdded) {
  int popCount = 0;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Consumer<Cart>(
          builder: (context, myCart, child) => Dialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.all(10),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 300,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                      child: Column(
                        children: [
                          Text((!alreadyAdded) ? "Successful" : "Unsuccessful",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              (!alreadyAdded)
                                  ? "$drugName has been added to your bag"
                                  : "$drugName is already in your bag",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(height: 15),
                          ButtonTheme(
                            minWidth: double.infinity,
                            buttonColor: dro_turquoise,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CartPage()));
                              },
                              child: Text("View Bag",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: double.infinity,
                            buttonColor: dro_turquoise,
                            //height: 100.0,
                            child: RaisedButton(
                              onPressed: () => Navigator.of(context)
                                  .popUntil((_) => popCount++ >= 2),
                              child: Text((!alreadyAdded) ? "Done" : "Cancel",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      )),
                  Positioned(
                      top: -50,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 44,
                        child: CircleAvatar(
                            backgroundColor: (!alreadyAdded)
                                ? dro_turquoise
                                : Colors.redAccent,
                            radius: 40,
                            child: Icon(
                                (!alreadyAdded) ? Icons.check : Icons.warning,
                                size: 50,
                                color: Colors.white)),
                      ))
                ],
              )),
        );
      });
}
