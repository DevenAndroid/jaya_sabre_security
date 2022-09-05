class ModelUserAssignment {
  bool? status;
  String? message;
  List<Data>? data;

  ModelUserAssignment({this.status, this.message, this.data});

  ModelUserAssignment.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? clientName;
  String? category;
  int? numberOfAgents;
  String? jobLocation;
  String? assignmentStartDate;
  String? assignmentEndDate;
  String? startTime;
  String? endTime;
  String? payRate;
  String? jobStatus;
  String? date;
  bool? isDone;
  bool? isCheck;

  Data(
      {this.title,
        this.clientName,
        this.category,
        this.numberOfAgents,
        this.jobLocation,
        this.assignmentStartDate,
        this.assignmentEndDate,
        this.startTime,
        this.endTime,
        this.payRate,
        this.jobStatus,
        this.date,
        this.isDone,
        this.isCheck});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    clientName = json['client_name'];
    category = json['category'];
    numberOfAgents = json['number_of_agents'];
    jobLocation = json['job_location'];
    assignmentStartDate = json['assignment_start_date'];
    assignmentEndDate = json['assignment_end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    payRate = json['pay_rate'];
    jobStatus = json['job_status'];
    date = json['date'];
    isDone = json['is_done'];
    isCheck = json['is_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['client_name'] = this.clientName;
    data['category'] = this.category;
    data['number_of_agents'] = this.numberOfAgents;
    data['job_location'] = this.jobLocation;
    data['assignment_start_date'] = this.assignmentStartDate;
    data['assignment_end_date'] = this.assignmentEndDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['pay_rate'] = this.payRate;
    data['job_status'] = this.jobStatus;
    data['date'] = this.date;
    data['is_done'] = this.isDone;
    data['is_check'] = this.isCheck;
    return data;
  }
}
