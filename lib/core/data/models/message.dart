import '../../entities/message.dart';

class MessageResponseModel extends MessageResponseEntitie {
  const MessageResponseModel({
    required super.title,
    required super.description,
    required super.code,
  });

  //
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "code": code,
    };
  }

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        code: json['description'] ?? '');
  }
}
