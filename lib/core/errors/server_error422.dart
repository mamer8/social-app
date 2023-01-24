import 'dart:convert';

class ServerError422 {
  List<dynamic> errors;

  String get errorMessage => errors.join(",");

  ServerError422({
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': errors,
    };
  }

  factory ServerError422.fromMap(Map<String, dynamic> map) {

    List<dynamic> _errors = [];
    if (map['message'] is List) {
      _errors = map['msg'];
    } else if (map['message'] is String) {
      _errors = [map['message']];
    } else
      if (map['message'] is Map) {
      _errors = (map['message']).values.toList();
    }
    return ServerError422(
      errors: _errors,

    );
  }

  String toJson() => json.encode(toMap());

  factory ServerError422.fromJson(String source) => ServerError422.fromMap(json.decode(source));
}
