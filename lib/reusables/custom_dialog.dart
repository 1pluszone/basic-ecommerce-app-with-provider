import 'package:flutter/material.dart';

customDialog(context) {
  int popCount = 0;
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.all(10),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Container(
                    width: double.infinity,
                    height: 215,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
                    child: Column(
                      children: [
                        Text("Successful"),
                        SizedBox(height: 10),
                        Text("Garlic Oil has been added to your bag"),
                        SizedBox(height: 15),
                        RaisedButton(
                          onPressed: () {},
                          child: Text("View Bag"),
                        ),
                        RaisedButton(
                          onPressed: () => Navigator.of(context)
                              .popUntil((_) => popCount++ >= 2),
                          child: Text("Done"),
                        )
                      ],
                    )),
                Positioned(
                    top: -50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 44,
                      child: CircleAvatar(
                          radius: 40, child: Icon(Icons.check, size: 50)),
                    ))
              ],
            ));
      });
}
