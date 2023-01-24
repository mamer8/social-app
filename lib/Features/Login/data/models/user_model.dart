class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? bio;
  String? uId;
  bool? isEmailVerified;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.image,
      this.bio,
      this.uId,
      this.isEmailVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    bio = json['bio'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['bio'] = bio;
    data['isEmailVerified'] = isEmailVerified;

    data['uId'] = uId;
    return data;
  }
}
