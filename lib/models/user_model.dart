class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.telp,
  });

  int? id;
  String? name;
  String? email;
  String? telp;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        telp: json["telp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "telp": telp,
      };
}
