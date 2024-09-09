import '../../login/models/response_login.dart';

class ResponseMoneySpendBy {
  List<MoneySpendByModel>? moneySpendByModel;
  Meta? meta;

  ResponseMoneySpendBy({this.moneySpendByModel, this.meta});

  ResponseMoneySpendBy.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseUsersViewModels'] != null) {
      moneySpendByModel = <MoneySpendByModel>[];
      json['getByIDResponseUsersViewModels'].forEach((v) {
        moneySpendByModel!
            .add(new MoneySpendByModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moneySpendByModel != null) {
      data['getByIDResponseUsersViewModels'] =
          this.moneySpendByModel!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class MoneySpendByModel {
  int? id;
  String? fullName;
  String? userName;
  String? password;
  int? userTypeID;
  String? userType;
  String? mobileNo;
  String? address;
  String? dateOfBirth;

  MoneySpendByModel(
      {this.id,
        this.fullName,
        this.userName,
        this.password,
        this.userTypeID,
        this.userType,
        this.mobileNo,
        this.address,
        this.dateOfBirth});

  MoneySpendByModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    password = json['password'];
    userTypeID = json['userTypeID'];
    userType = json['userType'];
    mobileNo = json['mobileNo'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['userTypeID'] = this.userTypeID;
    data['userType'] = this.userType;
    data['mobileNo'] = this.mobileNo;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}

