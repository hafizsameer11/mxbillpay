class FaqDataModel {
  String? id;
  String? question;
  String? answer;
  String? createdOn;

  FaqDataModel({this.id, this.question, this.answer, this.createdOn});

  FaqDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_on'] = this.createdOn;
    return data;
  }
}