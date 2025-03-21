import '../../login/models/response_login.dart';

class ResponseServiceType {
  List<ServiceTypeModel>? serviceTypeModel;
  Meta? meta;

  ResponseServiceType({this.serviceTypeModel, this.meta});

  ResponseServiceType.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseMasterViewModels'] != null) {
      serviceTypeModel = <ServiceTypeModel>[];
      json['getByIDResponseMasterViewModels'].forEach((v) {
        serviceTypeModel!
            .add(new ServiceTypeModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceTypeModel != null) {
      data['getByIDResponseMasterViewModels'] =
          this.serviceTypeModel!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ServiceTypeModel {
  int? id;
  String? name;

  ServiceTypeModel({this.id, this.name});

  ServiceTypeModel.fromJson(Map<String, dynamic> json) {
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