class RequestDropDownList {
  String? searchFor;
  int? pageNumber;
  int? rowOfPage;

  RequestDropDownList({this.searchFor, this.pageNumber, this.rowOfPage});

  RequestDropDownList.fromJson(Map<String, dynamic> json) {
    searchFor = json['searchFor'];
    pageNumber = json['pageNumber'];
    rowOfPage = json['rowOfPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchFor'] = this.searchFor;
    data['pageNumber'] = this.pageNumber;
    data['rowOfPage'] = this.rowOfPage;
    return data;
  }
}