class UserModel {
  // final String userName;
  final String sender;
  final String sms;
  final DateTime dateTime;
  bool? isMe;

  UserModel(
      {
      // required this.userName,
      required this.sender,
      required this.sms,
      required this.dateTime,
      this.isMe});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        // userName: json['userName'],
        sender: json['sender'],
        sms: json['sms'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
        isMe: json['isMe'] != null ? json['isMe'] : false,
      );

  Map<String, dynamic> toJson() => {
        // 'userName': userName,
        'sender': sender,
        'sms': sms,
        'dateTime': dateTime.millisecondsSinceEpoch,
        'isMe': isMe
      };
}
