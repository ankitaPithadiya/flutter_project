import '../../login/models/response_login.dart';

class ResponseExpenseType {
  List<ExpenseTypeModel>? getByIDResponseMasterViewModels;
  Meta? meta;

  ResponseExpenseType({this.getByIDResponseMasterViewModels, this.meta});

  ResponseExpenseType.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseMasterViewModels'] != null) {
      getByIDResponseMasterViewModels = <ExpenseTypeModel>[];
      json['getByIDResponseMasterViewModels'].forEach((v) {
        getByIDResponseMasterViewModels!
            .add(new ExpenseTypeModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getByIDResponseMasterViewModels != null) {
      data['getByIDResponseMasterViewModels'] =
          this.getByIDResponseMasterViewModels!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ExpenseTypeModel {
  int? id;
  String? name;

  ExpenseTypeModel({this.id, this.name});

  ExpenseTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

