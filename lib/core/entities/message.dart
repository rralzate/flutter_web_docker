import 'package:equatable/equatable.dart';

class MessageResponseEntitie extends Equatable {
  final String title;
  final String description;
  final String code;

  const MessageResponseEntitie({
    required this.title,
    required this.description,
    required this.code,
  });

  const MessageResponseEntitie.empty()
      : title = "",
        description = "",
        code = '';

  @override
  List<Object?> get props => [
        title,
        description,
        code,
      ];

  @override
  String toString() {
    return ''' 
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    Message Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      Title: $title,
      Description: $description,
      Code: $code,
    ''';
  }
}
