class ModelUserExpenses {
  bool? status;
  String? message;
  List<Data>? data;

  ModelUserExpenses({this.status, this.message, this.data});

  ModelUserExpenses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? jobTitle;
  String? expenseTitle;
  String? createdDate;
  String? downloadLink;

  Data({this.jobTitle, this.expenseTitle, this.createdDate, this.downloadLink});

  Data.fromJson(Map<String, dynamic> json) {
    jobTitle = json['job_title'];
    expenseTitle = json['expense_title'];
    createdDate = json['created_date'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_title'] = this.jobTitle;
    data['expense_title'] = this.expenseTitle;
    data['created_date'] = this.createdDate;
    data['download_link'] = this.downloadLink;
    return data;
  }
}
