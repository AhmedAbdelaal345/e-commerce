// ignore_for_file: unnecessary_this

class AddTaskResponseModel {
  String? message;
  bool? status;

  AddTaskResponseModel({this.message, this.status});

  AddTaskResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}