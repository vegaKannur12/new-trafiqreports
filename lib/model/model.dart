/////////////// Report category ///////////////////////
class ReportCategory {
  String? rgId;
  String? rgName;

  ReportCategory({this.rgId, this.rgName});

  ReportCategory.fromJson(Map<String, dynamic> json) {
    rgId = json['rg_id'];
    rgName = json['rg_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rg_id'] = this.rgId;
    data['rg_name'] = this.rgName; 
    return data;
  }
}
/////////////////// Report ////////////////////////
class Report {
  String? reportId;
  String? reportName;
  String? filters;
  String? reportElements;
  String? filterNames;

  Report(
      {this.reportId,
      this.reportName,
      this.filters,
      this.reportElements,
      this.filterNames});

  Report.fromJson(Map<String, dynamic> json) {
    reportId = json['report_id'];
    reportName = json['report_name'];
    filters = json['filters'];
    reportElements = json['report_elements'];
    filterNames = json['filter_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['report_id'] = this.reportId;
    data['report_name'] = this.reportName;
    data['filters'] = this.filters;
    data['report_elements'] = this.reportElements;
    data['filter_names'] = this.filterNames;
    return data;
  }
}
