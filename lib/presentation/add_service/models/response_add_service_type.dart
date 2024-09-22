class ResponseAddService {
  int? flag;
  Meta? meta;

  ResponseAddService({this.flag, this.meta});

  ResponseAddService.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
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

