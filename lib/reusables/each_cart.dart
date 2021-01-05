import 'package:dro_test/model/drug_model.dart';
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
        child: Column(
          children: [
            Image.asset(
              eachDrug.drugUrl,
              height: 105,
            ),
            Text(
              eachDrug.drugName,
            ),
            Text(eachDrug.drugDesc),
            Align(
              alignment: Alignment.centerRight,
              child: Text(eachDrug.amount.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
