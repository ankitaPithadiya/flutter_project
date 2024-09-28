class RequestFeedback {
  int? serviceID;
  int? serviceVisitID;
  String? remark;
  String? name;
  String? email;
  String? mo;
  String? designation;
  String? signImage;
  int? createdBy;

  RequestFeedback(
      {this.serviceID,
        this.serviceVisitID,
        this.remark,
        this.name,
        this.email,
        this.mo,
        this.designation,
        this.signImage,
        this.createdBy});

  RequestFeedback.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceVisitID = json['serviceVisitID'];
    remark = json['remark'];
    name = json['name'];
    email = json['email'];
    mo = json['mo'];
    designation = json['designation'];
    signImage = json['signImage'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceID'] = this.serviceID;
    data['serviceVisitID'] = this.serviceVisitID;
    data['remark'] = this.remark;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mo'] = this.mo;
    data['designation'] = this.designation;
    data['signImage'] = this.signImage;
    data['createdBy'] = this.createdBy;
    return data;
  }
}