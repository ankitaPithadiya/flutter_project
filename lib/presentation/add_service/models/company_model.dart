import '../../login/models/response_login.dart';

class ResponseCompany {
  List<CompanyModel>? companyModel;
  Meta? meta;

  ResponseCompany({this.companyModel, this.meta});

  ResponseCompany.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseCompanyViewModels'] != null) {
      companyModel = <CompanyModel>[];
      json['getByIDResponseCompanyViewModels'].forEach((v) {
        companyModel!
            .add(new CompanyModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyModel != null) {
      data['getByIDResponseCompanyViewModels'] = this
          .companyModel!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class CompanyModel {
  int? id;
  String? name;
  String? clientHeader;

  CompanyModel({this.id, this.name, this.clientHeader});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clientHeader = json['clientHeader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['clientHeader'] = this.clientHeader;
    return data;
  }
}
