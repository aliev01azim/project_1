class QuestionModel {
  String? id;
  String? email;
  String? number;
  String? dateOfZakaz;
  String? comment;
  QuestionModel({
    this.id,
    this.email,
    this.number,
    this.dateOfZakaz,
    this.comment,
  });
  QuestionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['cardNumber'],
        number = json['period'],
        dateOfZakaz = json['cvc'],
        comment = json['userName'];
}
