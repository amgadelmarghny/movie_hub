import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String message;
  final int code;
  final bool success;

  const ErrorModel({
    required this.message,
    required this.code,
    required this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['status_message'],
      code: json['status_code'],
      success: json['success'],
    );
  }

  @override
  List<Object?> get props => [message, code, success];
}
