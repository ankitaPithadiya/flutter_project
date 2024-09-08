import '../../login/models/response_login.dart';

class ResponseClient {
  List<GetByIDResponseCompanyViewModels>? getByIDResponseCompanyViewModels;
  Meta? meta;

  ResponseClient({this.getByIDResponseCompanyViewModels, this.meta});

  ResponseClient.fromJson(Map<String, dynamic> json) {
    if (json['getByIDResponseCompanyViewModels'] != null) {
      getByIDResponseCompanyViewModels = <GetByIDResponseCompanyViewModels>[];
      json['getByIDResponseCompanyViewModels'].forEach((v) {
        getByIDResponseCompanyViewModels!
            .add(new GetByIDResponseCompanyViewModels.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getByIDResponseCompanyViewModels != null) {
      data['getByIDResponseCompanyViewModels'] = this
          .getByIDResponseCompanyViewModels!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GetByIDResponseCompanyViewModels {
  int? id;
  String? name;

  GetByIDResponseCompanyViewModels({this.id, this.name});

  GetByIDResponseCompanyViewModels.fromJson(Map<String, dynamic> json) {
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