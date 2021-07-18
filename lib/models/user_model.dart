class UserModel {
  String? id;
  final String name;
  final String email;
  String? phoneNumber;
  UserModel(
      {this.id, required this.email, required this.name, this.phoneNumber});
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phoneNumber = json['phoneNumber'];
}
