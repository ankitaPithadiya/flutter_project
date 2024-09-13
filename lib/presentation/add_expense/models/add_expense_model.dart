import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class RequestAddExpense {
  int? expenseDoneBy;
  int? serviceID;
  String? expenseDate;
  int? expenseAmount;
  int? expenseTypeID;
  String? expenseRemark;
  int? createdBy;

  RequestAddExpense(
      {this.expenseDoneBy,
        this.serviceID,
        this.expenseDate,
        this.expenseAmount,
        this.expenseTypeID,
        this.expenseRemark,
        this.createdBy});

  RequestAddExpense.fromJson(Map<String, dynamic> json) {
    expenseDoneBy = json['expenseDoneBy'];
    serviceID = json['serviceID'];
    expenseDate = json['expenseDate'];
    expenseAmount = json['expenseAmount'];
    expenseTypeID = json['expenseTypeID'];
    expenseRemark = json['expenseRemark'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseDoneBy'] = this.expenseDoneBy;
    data['serviceID'] = this.serviceID;
    data['expenseDate'] = this.expenseDate;
    data['expenseAmount'] = this.expenseAmount;
    data['expenseTypeID'] = this.expenseTypeID;
    data['expenseRemark'] = this.expenseRemark;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
