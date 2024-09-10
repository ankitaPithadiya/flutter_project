import '../../login/models/response_login.dart';

class ResponseClient {
  List<ClientModel>? clientModel;
  Meta? meta;

  ResponseClient({this.clientModel, this.meta});

  ResponseClient.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseCompanyViewModels'] != null) {
      clientModel = <ClientModel>[];
      json['getByIDResponseCompanyViewModels'].forEach((v) {
        clientModel!
            .add(new ClientModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientModel != null) {
      data['getByIDResponseCompanyViewModels'] = this
          .clientModel!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ClientModel {
  int? id;
  String? name;

  ClientModel({this.id, this.name});

  ClientModel.fromJson(Map<String, dynamic> json) {
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