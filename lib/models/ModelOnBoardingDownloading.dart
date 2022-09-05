class ModelOnBoardingDownload {
  bool? status;
  String? message;
  Data? data;

  ModelOnBoardingDownload({this.status, this.message, this.data});

  ModelOnBoardingDownload.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? drugAlcohol;
  String? empDemo;
  String? ruleForce;
  String? sabreeNda;

  Data({this.drugAlcohol, this.empDemo, this.ruleForce, this.sabreeNda});

  Data.fromJson(Map<String, dynamic> json) {
    drugAlcohol = json['drug_alcohol'];
    empDemo = json['emp_demo'];
    ruleForce = json['rule_force'];
    sabreeNda = json['sabree_nda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drug_alcohol'] = this.drugAlcohol;
    data['emp_demo'] = this.empDemo;
    data['rule_force'] = this.ruleForce;
    data['sabree_nda'] = this.sabreeNda;
    return data;
  }
}
