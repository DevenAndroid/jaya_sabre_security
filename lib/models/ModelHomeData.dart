class ModelHomeData {
  bool? status;
  String? message;
  List<ModelHomeJobsData>? data;

  ModelHomeData({this.status, this.message, this.data});

  ModelHomeData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ModelHomeJobsData>[];
      json['data'].forEach((v) {
        data!.add(new ModelHomeJobsData.fromJson(v));
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

class ModelHomeJobsData {
  int? id;
  String? title;
  String? description;
  String? clientName;
  String? category;
  String? profileImage;
  int? numberOfAgents;
  String? jobLocation;
  String? jobAddress;
  String? payRate;
  String? assignmentStartDate;
  String? assignmentEndDate;
  String? startTime;
  String? endTime;
  String? pointContactname;
  String? pointPhonenumber;
  String? agentAttire;
  String? armed;
  String? concealed;
  String? status;
  String? createdDate;

  ModelHomeJobsData(
      {this.id,
        this.title,
        this.description,
        this.clientName,
        this.category,
        this.profileImage,
        this.numberOfAgents,
        this.jobLocation,
        this.jobAddress,
        this.payRate,
        this.assignmentStartDate,
        this.assignmentEndDate,
        this.startTime,
        this.endTime,
        this.pointContactname,
        this.pointPhonenumber,
        this.agentAttire,
        this.armed,
        this.concealed,
        this.status,
        this.createdDate});

  ModelHomeJobsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    clientName = json['client_name'];
    category = json['category'];
    profileImage = json['profile_image'];
    numberOfAgents = json['number_of_agents'];
    jobLocation = json['job_location'];
    jobAddress = json['job_address'];
    payRate = json['pay_rate'];
    assignmentStartDate = json['assignment_start_date'];
    assignmentEndDate = json['assignment_end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    pointContactname = json['point_contactname'];
    pointPhonenumber = json['point_phonenumber'];
    agentAttire = json['agent_attire'];
    armed = json['armed'];
    concealed = json['concealed'];
    status = json['status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['client_name'] = this.clientName;
    data['category'] = this.category;
    data['profile_image'] = this.profileImage;
    data['number_of_agents'] = this.numberOfAgents;
    data['job_location'] = this.jobLocation;
    data['job_address'] = this.jobAddress;
    data['pay_rate'] = this.payRate;
    data['assignment_start_date'] = this.assignmentStartDate;
    data['assignment_end_date'] = this.assignmentEndDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['point_contactname'] = this.pointContactname;
    data['point_phonenumber'] = this.pointPhonenumber;
    data['agent_attire'] = this.agentAttire;
    data['armed'] = this.armed;
    data['concealed'] = this.concealed;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    return data;
  }
}
