class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.telp,
    this.photo,
    this.type,
  });

  int? id;
  String? name;
  String? email;
  String? telp;
  String? photo;
  String? type;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        telp: json["telp"],
        type: json["type"],
        photo: json["photo"] == null
            ? "https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-768x768.jpg"
            : json['photo'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "telp": telp,
      };
}
