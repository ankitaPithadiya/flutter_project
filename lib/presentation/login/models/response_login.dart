class ResponseLogin {
  List<GetByIDResponseClientLocationViewModels>?
  getByIDResponseClientLocationViewModels;
  Meta? meta;

  ResponseLogin({this.getByIDResponseClientLocationViewModels, this.meta});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseClientLocationViewModels'] != null) {
      getByIDResponseClientLocationViewModels =
      <GetByIDResponseClientLocationViewModels>[];
      json['getByIDResponseClientLocationViewModels'].forEach((v) {
        getByIDResponseClientLocationViewModels!
            .add(new GetByIDResponseClientLocationViewModels.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getByIDResponseClientLocationViewModels != null) {
      data['getByIDResponseClientLocationViewModels'] = this
          .getByIDResponseClientLocationViewModels!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GetByIDResponseClientLocationViewModels {
  int? id;
  int? clientID;
  String? name;
  String? fullAddress;
  String? contactNo;

  GetByIDResponseClientLocationViewModels(
      {this.id, this.clientID, this.name, this.fullAddress, this.contactNo});

  GetByIDResponseClientLocationViewModels.fromJson(Map<String, dynamic> json) {
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
