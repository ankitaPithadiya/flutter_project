class RequestUpdateServiceStatus {
  int? id;
  int? serviceStatusID;
  String? updatedBy;

  RequestUpdateServiceStatus({this.id, this.serviceStatusID, this.updatedBy});

  RequestUpdateServiceStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceStatusID = json['serviceStatusID'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceStatusID'] = this.serviceStatusID;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}