class RequestExpenseList {
  String? fromDate;
  String? toDate;
  int? companyId;
  int? expenseDoneBy;

  RequestExpenseList(
      {this.fromDate, this.toDate, this.companyId, this.expenseDoneBy});

  RequestExpenseList.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    companyId = json['companyId'];
    expenseDoneBy = json['expenseDoneBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['companyId'] = this.companyId;
    data['expenseDoneBy'] = this.expenseDoneBy;
    return data;
  }
}