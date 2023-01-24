class MessageModel {
  String? text;
  String? receiverId;
  String? senderId;
  String? date;

  MessageModel({
    this.receiverId,
    this.senderId,
    this.text,
    this.date,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiverId'] = receiverId;
    data['senderId'] = senderId;
    data['text'] = text;
    data['date'] = date;
    return data;
  }
}
