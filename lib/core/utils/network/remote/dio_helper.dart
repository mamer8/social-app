import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'dart:convert';

import '../../../errors/server_error.dart';

class DioClient {
  static String ApiKey = "languages_code";
  static late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dashboard.byan.shop/api/',
    ),
  );

  static Future<Either<ServerError, Response>> PostData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      "api_key": ApiKey,
      // 'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };
    try {
      final response = await _dio.patch(
        queryParameters: query,
        url,
        data: data,
        // options: Options(followRedirects: false, validateStatus: (status) {return status! < 200;}),
      );
      return Right(response);
    } on DioError catch (e) {
      final body = json.decode(e.response.toString());
      print(body);
      print(body["message"]);
      if (e.response!.statusCode == 422) {
        // final body = json.decode(e.response!.data["data"]);

        // print("mmmmmmmmmmmmm${e.response!.data["data"][dynamic]}");
        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      } else {
        // final serverError = ServerError.fromJson(e.response?.data);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> postFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      "api_key": ApiKey,
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      return Right(response);
    } on DioError catch (e) {
      final body = json.decode(e.response.toString());
      print(body);
      print(body["message"]);

      if (e.response!.statusCode == 422 || e.response!.statusCode == 401) {
        // final body = json.decode(e.response!.data["data"]);

        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }
      if (e.response!.statusCode == 401 || e.response!.statusCode == 422) {
        // final body = json.decode(e.response!.data["data"]);

        // print("mmmmmmmmmmmmm${e.response!.data["data"][dynamic]}");
        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${e.response!.data["error_message"]}"],
          ),
        );
      } else {
        // final serverError = ServerError.fromJson(e.response?.data);
        return Left(
          ServerError(
            errors: ["${e.response!.data["error_message"]}"],
          ),
        );
      }
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> putFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      "api_key": ApiKey,
      'token': token,
    };
    try {
      final response = await _dio.patch(
        url,
        data: data,
      );
      return Right(response);
    } on DioError catch (e) {
      if (e.response!.statusCode! > 500) {
        return Left(ServerError(errors: ['Something went wrong']));
      }
      if (e.response?.data is String) {
        return Left(ServerError(errors: [e.response?.data ?? '']));
      }
      final serverError = ServerError.fromMap(
        e.response?.data,
      );
      print(e.toString());
      return Left(serverError);
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      // 'token': token,
      "Authorization": "Bearer $token",
      "api_key": ApiKey,
    };
    try {
      final response = await _dio.get(url, queryParameters: query);
      return Right(response);
    } on DioError catch (e) {
      final body = json.decode(e.response.toString());
      print(body);
      print(body["message"]);

      if (e.response!.statusCode == 422) {
        // final body = json.decode(e.response!.data["data"]);

        // print("mmmmmmmmmmmmm${e.response!.data["data"][dynamic]}");
        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);

        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }
      if (e.response!.statusCode == 401) {
        // final body = json.decode(e.response!.data["data"]);

        // print("mmmmmmmmmmmmm${e.response!.data["data"][dynamic]}");
        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      } else {
        print(e.response!.headers);
        print(e.response!.statusCode.toString());
        print(e.response!.statusMessage);
        // final serverError = ServerError.fromJson(e.response?.data);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }

      //
      // print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      // ServerError serverError;
      // // if (e.response?.data is Map) {
      // //   serverError = ServerError.fromMap(
      // //     e.response?.data,
      // //   );
      // // } else {
      // //   serverError = ServerError(errors: [e.response?.data ?? '']);
      // // }
      // print(e.toString());
      // return Left(
      //   ServerError(
      //     errors: ["Something Went Wrong"],
      //   ),
      // );
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      "api_key": ApiKey,
      'Content-Type': 'application/json',
      // 'token': token,
      "Authorization": "Bearer $token",
    };
    try {
      final response = await _dio.delete(url, queryParameters: query);
      return Right(response);
    } on DioError catch (e) {
      ServerError serverError;
      // if (e.response?.data is Map) {
      //   serverError = ServerError.fromMap(
      //     e.response?.data,
      //   );
      // } else {
      //   serverError = ServerError(errors: [e.response?.data ?? '']);
      // }
      print(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("Url${url}");
    print("data${data.toString()}");
    print("token${token}");

    _dio.options.headers = {
      "api_key": ApiKey,
      "Authorization": "Bearer $token",
    };
    dynamic x;
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      x = response;
      return Right(response);
    } on DioError catch (e) {
      final body = json.decode(e.response.toString());
      print(body);
      print(body["message"]);
      if (e.response!.statusCode == 401 || e.response!.statusCode == 422) {
        // final body = json.decode(e.response!.data["data"]);

        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      } else {
        // final serverError = ServerError.fromJson(e.response?.data);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["serverError"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> postData2({
    required String url,
    var data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("Url${url}");
    print("data${data.toString()}");
    print("token${token}");

    _dio.options.headers = {
      "api_key": ApiKey,
      "Authorization": "Bearer $token",
    };
    dynamic x;
    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(data),
      );
      x = response;
      return Right(response);
    } on DioError catch (e) {
      final body = json.decode(e.response.toString());
      print(body);
      print(body["message"]);
      if (e.response!.statusCode == 401 || e.response!.statusCode == 422) {
        // final body = json.decode(e.response!.data["data"]);

        // print("wwwwwwwwwwwww${body['data']}");
        // return Right(x);
        // Right(response);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      } else {
        // final serverError = ServerError.fromJson(e.response?.data);
        return Left(
          ServerError(
            errors: ["${body["message"]}"],
          ),
        );
      }
    } catch (e) {
      // Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["serverError"],
        ),
      );
    }
  }
}
