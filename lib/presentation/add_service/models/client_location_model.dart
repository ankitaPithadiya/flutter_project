class ResponseClientLocation {
  List<ClientLocationModel>?
  clientLocationModel;
  Meta? meta;

  ResponseClientLocation(
      {this.clientLocationModel, this.meta});

  ResponseClientLocation.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseClientLocationViewModels'] != null) {
      clientLocationModel =
      <ClientLocationModel>[];
      json['getByIDResponseClientLocationViewModels'].forEach((v) {
        clientLocationModel!
            .add(new ClientLocationModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientLocationModel != null) {
      data['getByIDResponseClientLocationViewModels'] = this
          .clientLocationModel!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ClientLocationModel {
  int? id;
  int? clientID;
  String? name;
  String? fullAddress;
  String? contactNo;

  ClientLocationModel(
      {this.id, this.clientID, this.name, this.fullAddress, this.contactNo});

  ClientLocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientID = json['clientID'];
    name = json['name'];
    fullAddress = json['fullAddress'];
    contactNo = json['contactNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientID'] = this.clientID;
    data['name'] = this.name;
    data['fullAddress'] = this.fullAddress;
    data['contactNo'] = this.contactNo;
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