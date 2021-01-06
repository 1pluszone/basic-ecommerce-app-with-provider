import 'package:dro_test/model/drug_model.dart';
import 'package:dro_test/reusables/color_codes.dart';
import 'package:dro_test/screens/drug_detail.dart';
import 'package:flutter/material.dart';

//todo.. create this as a widget in hompage
class EachCart extends StatelessWidget {
  final DrugModel eachDrug;
  final int index;

  EachCart({@required this.eachDrug, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('index $index tapped.');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrugDetail(eachDrug: eachDrug),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  eachDrug.drugUrl,
                  height: 105,
                ),
              ),
              Text(
                eachDrug.drugName,
              ),
              Text(eachDrug.drugDesc),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: grey_color,
                  ),
                  child: Text("₦${eachDrug.amount}",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
