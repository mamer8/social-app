import 'dart:convert';

class ServerError {




  List<dynamic> errors;

  String get errorMessage => errors.join(",");

  ServerError({
    required this.errors,
  });

  Map<String, dynamic> toMap() {
  return {
      'message': errors,
    };
  }

  factory ServerError.fromMap(Map<String, dynamic> map) {

    List<dynamic> _errors = [];
    if (map['message'] is List) {
      _errors = map['msg'];
    } else if (map['message'] is String) {
      _errors = [map['message']];
    } else
      if (map['message'] is Map) {
      _errors = (map['message']).values.toList();
    }
    return ServerError(
      errors: _errors,

    );
  }

  String toJson() => json.encode(toMap());

  factory ServerError.fromJson(String source) => ServerError.fromMap(json.decode(source));
}
