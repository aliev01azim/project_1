class ZakazModel {
  final String id;
  final String name;
  final DateTime date;
  final String status;
  final String price;
  const ZakazModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.price,
      required this.date});
  ZakazModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        date = json['date'],
        price = json['price'],
        status = json['status'];
}
