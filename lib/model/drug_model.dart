class DrugModel {
  String drugUrl;
  String drugName;
  String drugDesc;
  int amount;
  String soldBy;
  String constituents;
  String packSize;
  String dispensedIn;

  DrugModel(
      {this.drugUrl,
      this.drugName,
      this.drugDesc,
      this.amount,
      this.soldBy,
      this.constituents,
      this.packSize,
      this.dispensedIn});

  DrugModel.fromJson(Map<String, dynamic> json) {
    drugUrl = json['drugUrl'];
    drugName = json['drugName'];
    drugDesc = json['drugDesc'];
    amount = json['amount'];
    soldBy = json['soldBy'];
    constituents = json['constituents'];
    packSize = json['packSize'];
    dispensedIn = json['dispensedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drugUrl'] = this.drugUrl;
    data['drugName'] = this.drugName;
    data['drugDesc'] = this.drugDesc;
    data['amount'] = this.amount;
    data['soldBy'] = this.soldBy;
    data['constituents'] = this.constituents;
    data['packSize'] = this.packSize;
    data['dispensedIn'] = this.dispensedIn;
    return data;
  }
}
