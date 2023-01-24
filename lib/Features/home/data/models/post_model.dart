class PostModel {
  String? name;
  String? text;
  String? postImage;
  String? image;
  String? date;
  String? uId;

  PostModel({
    this.name,
    this.image,
    this.postImage,
    this.uId,
    this.text,
    this.date,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    postImage = json['postImage'];
    text = json['text'];
    image = json['image'];
    date = json['date'];
    uId = json['uID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['postImage'] = postImage;
    data['text'] = text;
    data['image'] = image;
    data['date'] = date;
    data['uId'] = uId;
    return data;
  }
}
