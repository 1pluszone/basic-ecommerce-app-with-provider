import "dart:convert";
import 'package:flutter/material.dart';

import '../model/drug_model.dart';

Future<List<DrugModel>> getData(context) async {
  try {
    final response = await json.decode(await DefaultAssetBundle.of(context)
        .loadString('asset/json/drug_data.json'));
    print(response);
    List<DrugModel> parsedList = parseJson(response);
    return parsedList;
  } catch (e) {
    print("an error occured $e");
    return [];
  }
}

List<DrugModel> parseJson(response) {
  if (response == null) {
    return [];
  }
  List<DrugModel> drugList;
  drugList = (response as List).map((i) => DrugModel.fromJson(i)).toList();
  return drugList;
}
