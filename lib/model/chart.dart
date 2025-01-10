class Chart {
  int? typeID;
  int? amount;

  Chart({this.typeID, this.amount});

  Chart.fromJson(Map<String, dynamic> json) {
    typeID = json['typeID'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeID'] = this.typeID;
    data['amount'] = this.amount;
    return data;
  }
}
