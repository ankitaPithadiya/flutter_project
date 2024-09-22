class ResponseLogin {
  GetByIDResponseUsersViewModel? getByIDResponseUsersViewModel;
  Token? token;
  Meta? meta;

  ResponseLogin({this.getByIDResponseUsersViewModel, this.token, this.meta});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    getByIDResponseUsersViewModel =
        json['getByIDResponseUsersViewModel'] != null
            ? new GetByIDResponseUsersViewModel.fromJson(
                json['getByIDResponseUsersViewModel'])
            : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getByIDResponseUsersViewModel != null) {
      data['getByIDResponseUsersViewModel'] =
          this.getByIDResponseUsersViewModel!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GetByIDResponseUsersViewModel {
  int? id;
  String? fullName;

  GetByIDResponseUsersViewModel({this.id, this.fullName});

  GetByIDResponseUsersViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    return data;
  }
}

class Token {
  String? jwtToken;
  String? jwtExpiration;

  Token({this.jwtToken, this.jwtExpiration});

  Token.fromJson(Map<String, dynamic> json) {
    jwtToken = json['jwtToken'];
    jwtExpiration = json['jwtExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwtToken'] = this.jwtToken;
    data['jwtExpiration'] = this.jwtExpiration;
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
