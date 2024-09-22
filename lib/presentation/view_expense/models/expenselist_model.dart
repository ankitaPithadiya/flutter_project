class ResponseExpenseList {
  List<ExpenseReport>? expenseReport;
  Meta? meta;

  ResponseExpenseList({this.expenseReport, this.meta});

  ResponseExpenseList.fromJson(Map<String, dynamic> json) {
    if (json['expenseReport'] != null) {
      expenseReport = <ExpenseReport>[];
      json['expenseReport'].forEach((v) {
        expenseReport!.add(new ExpenseReport.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expenseReport != null) {
      data['expenseReport'] =
          this.expenseReport!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ExpenseReport {
  int? expenseID;
  String? paymentDoneBy;
  int? serviceID;
  String? expenseDate;
  int? expenseAmount;
  String? expenseType;
  String? expenseRemark;
  String? rePaymentStatus;
  String? rePaymentRemark;
  String? rePayDate;

  ExpenseReport(
      {this.expenseID,
        this.paymentDoneBy,
        this.serviceID,
        this.expenseDate,
        this.expenseAmount,
        this.expenseType,
        this.expenseRemark,
        this.rePaymentStatus,
        this.rePaymentRemark,
        this.rePayDate});

  ExpenseReport.fromJson(Map<String, dynamic> json) {
    expenseID = json['expenseID'];
    paymentDoneBy = json['paymentDoneBy'];
    serviceID = json['serviceID'];
    expenseDate = json['expenseDate'];
    expenseAmount = json['expenseAmount'];
    expenseType = json['expenseType'];
    expenseRemark = json['expenseRemark'];
    rePaymentStatus = json['rePaymentStatus'];
    rePaymentRemark = json['rePaymentRemark'];
    rePayDate = json['rePayDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseID'] = this.expenseID;
    data['paymentDoneBy'] = this.paymentDoneBy;
    data['serviceID'] = this.serviceID;
    data['expenseDate'] = this.expenseDate;
    data['expenseAmount'] = this.expenseAmount;
    data['expenseType'] = this.expenseType;
    data['expenseRemark'] = this.expenseRemark;
    data['rePaymentStatus'] = this.rePaymentStatus;
    data['rePaymentRemark'] = this.rePaymentRemark;
    data['rePayDate'] = this.rePayDate;
    return data;
  }
}

class Meta {
  String? message;
  String? status;
  int? code;

  Meta({this.message, this.status, this.code});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}
