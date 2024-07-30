import 'package:equatable/equatable.dart';

import 'message.dart';

class ResponseWithoutResultEntity extends Equatable {
  final bool success;
  final MessageResponseEntitie messageResponse;

  const ResponseWithoutResultEntity({
    required this.success,
    required this.messageResponse,
  });

  const ResponseWithoutResultEntity.empty()
      : success = false,
        messageResponse = const MessageResponseEntitie(
          title: "",
          description: "",
          code: '',
        );

  @override
  List<Object?> get props => [
        success,
        messageResponse,
      ];

  @override
  String toString() {
    return ''' 
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    General Response Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      Success: $success,
      Message: ${messageResponse.toString()},

    ''';
  }
}
