class PaymentCardModel {
  String? id;
  bool? isEnable;
  String? cardNumber;
  String? period;
  String? cvc;
  String? userName;
  PaymentCardModel({
    this.id,
    this.isEnable,
    this.cardNumber,
    this.period,
    this.cvc,
    this.userName,
  });
  PaymentCardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        isEnable = json['isEnable'],
        cardNumber = json['cardNumber'],
        period = json['period'],
        cvc = json['cvc'],
        userName = json['userName'];
}
