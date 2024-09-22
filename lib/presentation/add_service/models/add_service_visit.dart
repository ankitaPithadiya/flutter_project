class RequestAddServiceVisit {
  int? serviceID;
  int? engineerID;
  String? problemReported;
  String? serviceRendered;
  int? serviceStatusID;
  String? visitScheduleDate;
  bool? givePriority;
  String? make;
  String? model;
  String? srNo;
  int? createdBy;

  RequestAddServiceVisit(
      {this.serviceID,
        this.engineerID,
        this.problemReported,
        this.serviceRendered,
        this.serviceStatusID,
        this.visitScheduleDate,
        this.givePriority,
        this.make,
        this.model,
        this.srNo,
        this.createdBy});

  RequestAddServiceVisit.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    engineerID = json['engineerID'];
    problemReported = json['problemReported'];
    serviceRendered = json['serviceRendered'];
    serviceStatusID = json['serviceStatusID'];
    visitScheduleDate = json['visitScheduleDate'];
    givePriority = json['givePriority'];
    make = json['make'];
    model = json['model'];
    srNo = json['srNo'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceID'] = this.serviceID;
    data['engineerID'] = this.engineerID;
    data['problemReported'] = this.problemReported;
    data['serviceRendered'] = this.serviceRendered;
    data['serviceStatusID'] = this.serviceStatusID;
    data['visitScheduleDate'] = this.visitScheduleDate;
    data['givePriority'] = this.givePriority;
    data['make'] = this.make;
    data['model'] = this.model;
    data['srNo'] = this.srNo;
    data['createdBy'] = this.createdBy;
    return data;
  }
}