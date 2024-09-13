import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class RequestAddService {
  int? clientID;
  int? clientLocationID;
  int? serviceTypeID;
  String? userComplaint;
  bool? systemDown;
  int? equipmentTypeID;
  int? companyId;
  String? userName;
  int? createdBy;

  RequestAddService(
      {this.clientID,
        this.clientLocationID,
        this.serviceTypeID,
        this.userComplaint,
        this.systemDown,
        this.equipmentTypeID,
        this.companyId,
        this.userName,
        this.createdBy});

  RequestAddService.fromJson(Map<String, dynamic> json) {
    clientID = json['clientID'];
    clientLocationID = json['clientLocationID'];
    serviceTypeID = json['serviceTypeID'];
    userComplaint = json['userComplaint'];
    systemDown = json['systemDown'];
    equipmentTypeID = json['equipmentTypeID'];
    companyId = json['companyId'];
    userName = json['userName'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientID'] = this.clientID;
    data['clientLocationID'] = this.clientLocationID;
    data['serviceTypeID'] = this.serviceTypeID;
    data['userComplaint'] = this.userComplaint;
    data['systemDown'] = this.systemDown;
    data['equipmentTypeID'] = this.equipmentTypeID;
    data['companyId'] = this.companyId;
    data['userName'] = this.userName;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
