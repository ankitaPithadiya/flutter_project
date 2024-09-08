import '../../login/models/response_login.dart';

class ResponseServiceType {
  List<GetByIDResponseMasterViewModels>? getByIDResponseMasterViewModels;
  Meta? meta;

  ResponseServiceType({this.getByIDResponseMasterViewModels, this.meta});

  ResponseServiceType.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseMasterViewModels'] != null) {
      getByIDResponseMasterViewModels = <GetByIDResponseMasterViewModels>[];
      json['getByIDResponseMasterViewModels'].forEach((v) {
        getByIDResponseMasterViewModels!
            .add(new GetByIDResponseMasterViewModels.fromJson(v));
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

class GetByIDResponseMasterViewModels {
  int? id;
  String? name;

  GetByIDResponseMasterViewModels({this.id, this.name});

  GetByIDResponseMasterViewModels.fromJson(Map<String, dynamic> json) {
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