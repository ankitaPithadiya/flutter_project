class ResponseServiceList {
  List<ServiceReport>? serviceReport;
  Meta? meta;

  ResponseServiceList({this.serviceReport, this.meta});

  ResponseServiceList.fromJson(Map<String, dynamic> json) {
    if (json['serviceReport'] != null) {
      serviceReport = <ServiceReport>[];
      json['serviceReport'].forEach((v) {
        serviceReport!.add(new ServiceReport.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceReport != null) {
      data['serviceReport'] =
          this.serviceReport!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class ServiceReport {
  int? serviceId;
  String? compainDate;
  String? client;
  String? clientLocation;
  String? serviceType;
  bool? systemDown;
  String? equipmentType;
  String? userName;
  String? userComplaint;
  int? serviceVisitID;
  String? serviceStatus;
  String? engineerName;
  String? problemReported;
  String? serviceRendered;
  String? visitScheduleDate;

  ServiceReport(
      {this.serviceId,
        this.compainDate,
        this.client,
        this.clientLocation,
        this.serviceType,
        this.systemDown,
        this.equipmentType,
        this.userName,
        this.userComplaint,
        this.serviceVisitID,
        this.serviceStatus,
        this.engineerName,
        this.problemReported,
        this.serviceRendered,
        this.visitScheduleDate});

  ServiceReport.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    compainDate = json['compainDate'];
    client = json['client'];
    clientLocation = json['clientLocation'];
    serviceType = json['serviceType'];
    systemDown = json['systemDown'];
    equipmentType = json['equipmentType'];
    userName = json['userName'];
    userComplaint = json['userComplaint'];
    serviceVisitID = json['serviceVisitID'];
    serviceStatus = json['serviceStatus'];
    engineerName = json['engineerName'];
    problemReported = json['problemReported'];
    serviceRendered = json['serviceRendered'];
    visitScheduleDate = json['visitScheduleDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['compainDate'] = this.compainDate;
    data['client'] = this.client;
    data['clientLocation'] = this.clientLocation;
    data['serviceType'] = this.serviceType;
    data['systemDown'] = this.systemDown;
    data['equipmentType'] = this.equipmentType;
    data['userName'] = this.userName;
    data['userComplaint'] = this.userComplaint;
    data['serviceVisitID'] = this.serviceVisitID;
    data['serviceStatus'] = this.serviceStatus;
    data['engineerName'] = this.engineerName;
    data['problemReported'] = this.problemReported;
    data['serviceRendered'] = this.serviceRendered;
    data['visitScheduleDate'] = this.visitScheduleDate;
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