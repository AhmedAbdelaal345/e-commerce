// ignore_for_file: unnecessary_this

class AddTaskResponseModel {
  String? title;
  String? description;
  dynamic? image;

  AddTaskResponseModel({this.title, this.description,this.image});

  AddTaskResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
