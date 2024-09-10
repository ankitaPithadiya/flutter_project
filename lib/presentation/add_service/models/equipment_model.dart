import '../../login/models/response_login.dart';

class ResponseEquipmentTypeModel {
  List<EquipmentType>? equipmentTypeModel;
  Meta? meta;

  ResponseEquipmentTypeModel({this.equipmentTypeModel, this.meta});

  ResponseEquipmentTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseMasterViewModels'] != null) {
      equipmentTypeModel = <EquipmentType>[];
      json['getByIDResponseMasterViewModels'].forEach((v) {
        equipmentTypeModel!
            .add(new EquipmentType.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.equipmentTypeModel != null) {
      data['getByIDResponseMasterViewModels'] =
          this.equipmentTypeModel!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class EquipmentType {
  int? id;
  String? name;

  EquipmentType({this.id, this.name});

  EquipmentType.fromJson(Map<String, dynamic> json) {
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

