class RequestServiceList {
  String? fromDate;
  String? toDate;
  int? companyId;
  int? engineerId;

  RequestServiceList(
      {this.fromDate, this.toDate, this.companyId, this.engineerId});

  RequestServiceList.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    companyId = json['companyId'];
    engineerId = json['engineerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['companyId'] = this.companyId;
    data['engineerId'] = this.engineerId;
    return data;
  }
}